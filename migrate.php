<?php

if (PHP_SAPI !== 'cli') {
    die('Access denied');
}

require_once 'init.php';

$env = new EnvManager('.env');

$db_host = $env->get('MAIN_DATABASE_HOST');
$db_user = $env->get('MAIN_DATABASE_USER');
$db_pass = $env->get('MAIN_DATABASE_USER_PASS');
$dbname  = $env->get('MAIN_DATABASE_NAME');

try {
    $conn = new PDO("pgsql:host=$db_host;dbname=postgres", $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $conn->prepare("SELECT 1 FROM pg_database WHERE datname = :dbname");
    $stmt->execute([':dbname' => $dbname]);
    $result = $stmt->fetch();

    if (!empty($result)) {
        $answer = readline("Database {$dbname} already exists. Drop and recreate? (Y/N): ");
        $answer = strtolower(trim($answer));

        if ($answer === 'y' || $answer === 'yes') {
            // encerra conexões ativas
            $stmt = $conn->prepare("
                SELECT pg_terminate_backend(pid)
                FROM pg_stat_activity
                WHERE datname = :dbname AND pid <> pg_backend_pid()
            ");
            $stmt->execute([':dbname' => $dbname]);

            $conn->exec("DROP DATABASE IF EXISTS {$dbname}");
            echo "Database {$dbname} dropped.\n";

            $conn->exec("CREATE DATABASE {$dbname} WITH ENCODING 'UTF8' TEMPLATE template1");
            echo "Database {$dbname} created!\n";
        } else {
            echo "Keeping existing database.\n";
        }
    } else {
        $conn->exec("CREATE DATABASE {$dbname} WITH ENCODING 'UTF8' TEMPLATE template1");
        echo "Database {$dbname} created!\n";
    }

    // conecta no banco recém-criado
    $conn = null;
    $conn = new PDO("pgsql:host=$db_host;dbname={$dbname}", $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // pega todos os arquivos SQL que tenham 'pgsql' no nome
    $sqlFiles = glob('app/database/builder/*pgsql*.sql');
    if (empty($sqlFiles)) {
        echo "No SQL files found.\n";
        exit;
    }

    // junta todos os arquivos em um único SQL
    $fullSql = "";
    foreach ($sqlFiles as $file) {
        echo "Reading {$file}...\n";
        $fullSql .= file_get_contents($file) . "\n";
    }

    // roda tudo de uma vez com session_replication_role
    $conn->exec("SET session_replication_role = replica;");
    $conn->exec($fullSql);
    $conn->exec("SET session_replication_role = origin;");

    echo "All SQL files imported successfully!\n";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
