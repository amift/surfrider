<?php

/*
 * Modified: prepend directory path of current file, because of this file own different ENV under between Apache and command line.
 * NOTE: please remove this comment.
 */
defined('BASE_PATH') || define('BASE_PATH', getenv('BASE_PATH') ?: realpath(dirname(__FILE__) . '/../..'));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/app');

require_once BASE_PATH . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
if (is_file('.env')) $dotenv->load();

return new \Phalcon\Config([
    'database' => [
        'adapter'    => getenv('DB_ADAPTER') ?: 'Mysql',
        'charset'    => getenv('DB_CHARSET') ?: 'utf8',
        'host'       => getenv('DB_HOST') ?: 'localhost',
        'username'   => getenv('DB_USER') ?: 'root',
        'password'   => getenv('DB_PASS') ?: '',
        'dbname'     => getenv('DB_NAME') ?: 'test',
    ],

    'application' => [
        'modelsDir'      => APP_PATH . '/models/',
        'migrationsDir'  => APP_PATH . '/migrations/',
        'viewsDir'       => APP_PATH . '/views/',
        'baseUri'        => '/',
    ]
]);
