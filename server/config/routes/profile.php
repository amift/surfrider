<?php
use Phalcon\Mvc\Micro\Collection;
use SurfRider\Controllers\ProfileController;

$collection = new Collection();

$collection->setHandler(ProfileController::class, true);

$collection->setPrefix('/api/profile');

$collection
        ->post("/", "profile")
        ->get("/", "profile")
        ;



return $collection;