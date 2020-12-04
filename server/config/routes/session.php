<?php
use Phalcon\Mvc\Micro\Collection;
use SurfRider\Controllers\SessionController;

$collection = new Collection();

$collection->setHandler(SessionController::class, true);

$collection->setPrefix('/api/session');

$collection
        ->post("/start", "start")
        ->post("/record", "record")
        ->post("/stop", "stop");



return $collection;