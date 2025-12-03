<?php

$env = new EnvManager('.env');

$array = [
    'host' => $env->get('MAIN_DATABASE_HOST'),
    'user' => $env->get('MAIN_DATABASE_USER'),
    'pass' => $env->get('MAIN_DATABASE_USER_PASS'),
    'type' => $env->get('MAIN_DATABASE_TYPE'),
    'port' => $env->get('MAIN_DATABASE_PORT'),
    'name' => $env->get('MAIN_DATABASE_NAME'),
    'prep' => $env->get('MAIN_DATABASE_PREP'),
    'slog' => $env->get('MAIN_DATABASE_SLOG'),
];

return $array;