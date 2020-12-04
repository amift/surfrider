<?php
/*
 * Modified: prepend directory path of current file, because of this file own different ENV under between Apache and command line.
 * NOTE: please remove this comment.
 */
defined('BASE_PATH') || define('BASE_PATH', getenv('BASE_PATH') ?? realpath(dirname(__FILE__) . '/../..'));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/app');

require_once (dirname(__DIR__) . '/vendor/autoload.php');

(Dotenv\Dotenv::createImmutable(dirname(__DIR__)))->load();

return new \Phalcon\Config([
    'database' => [
        'adapter'    => $_ENV['DB_ADAPTER'] ?? 'Mysql',
        'charset'    => $_ENV['DB_CHARSET'] ?? 'utf8',
        'host'       => $_ENV['DB_HOST'] ?? 'localhost',
        'port'       => intval($_ENV['DB_PORT'] ?? 3308),
        'username'   => $_ENV['DB_USER'] ?? 'root',
        'password'   => $_ENV['DB_PASS'] ?? '',
        'dbname'     => $_ENV['DB_NAME'] ?? 'test',
    ],

    'application' => [
        'modelsDir'      => APP_PATH . '/Models/',
        'controllersDir' => APP_PATH . '/Controllers/',
        'migrationsDir'  => BASE_PATH . '/resources/migrations/',
        'viewsDir'       => BASE_PATH . '/resources/views/',
        'baseUri'        => '/',
    ]
]);
