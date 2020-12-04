<?php
use Phalcon\Mvc\Micro\Collection;
use SurfRider\Controllers\AuthController;

$collection = new Collection();

$collection->setHandler(
    new AuthController()
);

$collection->setPrefix('/api');

$collection
        ->post("/auth/check", "check")
        ->post("/auth/login", "login")
        ->post("/auth/register", "register");



return $collection;