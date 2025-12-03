<?php

class EnvManager
{
    private string $envFile;
    private array $vars = [];

    public function __construct(string $envFile = null)
    {
        $this->envFile = $envFile ?? '.env';
        $this->load();
        $this->loadFromContainer();
    }

    /**
     * Carrega o arquivo .env
     */
    public function load(): void
    {
        if (!file_exists($this->envFile)) return;

        $lines = file($this->envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            $line = trim($line);
            if ($line === '' || strpos($line, '#') === 0) continue;

            if (strpos($line, '=') !== false) {
                [$key, $value] = explode('=', $line, 2);
                $key   = trim($key);
                $value = trim($value, "\"'");
                $this->vars[$key] = $value;

                if (!defined($key)) {
                    define($key, $value);
                }
            }
        }
    }

    /**
     * Carrega variáveis diretamente do container
     */
    private function loadFromContainer(): void
    {
        foreach ($_ENV as $key => $value) {
            $this->vars[$key] = $value;
            if (!defined($key)) {
                define($key, $value);
            }
        }

        // Também tenta pegar via getenv() caso não esteja em $_ENV
        foreach ($this->vars as $key => $value) {
            $envValue = getenv($key);
            if ($envValue !== false) {
                $this->vars[$key] = $envValue;
            }
        }
    }

    public function get(string $key, $default = null)
    {
        return $this->vars[$key] ?? $default;
    }

    public function set(string $key, string $value): void
    {
        $this->vars[$key] = $value;

        if (!defined($key)) {
            define($key, $value);
        }
    }

    public function save(): void
    {
        $lines = [];
        foreach ($this->vars as $key => $value) {
            $lines[] = $key . '=' . $value;
        }

        file_put_contents($this->envFile, implode(PHP_EOL, $lines) . PHP_EOL);
    }

    public function syncConstants(array $constants): void
    {
        foreach ($constants as $key => $value) {
            if (!defined($key)) {
                define($key, $value);
            }
            $this->set($key, $value);
        }
    }
}
