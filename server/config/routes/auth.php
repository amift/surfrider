<?php
use Phalcon\Mvc\Micro\Collection;
use SurfRider\Controllers\AuthController;

$collection = new Collection();

$collection->setHandler(AuthController::class,true);

$collection->setPrefix('/api');

$collection
        ->post("/auth/logged", "logged")
        ->post("/auth/login", "login")
        ->post("/auth/register", "register");



return $collection;