<?php

/**
 * Registering an autoloader
 */
$loader = new \Phalcon\Loader();

$loader->registerNamespaces(
    [
       'SurfRider' => APP_PATH
    ]
)->register();
