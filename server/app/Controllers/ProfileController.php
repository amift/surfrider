<?php
declare(strict_types=1);
namespace SurfRider\Controllers;

use Exception;

class ProfileController extends AuthMiddleware
{
    public function onConstruct()
    {
        parent::onConstruct();

        if (!$this->isLogged())
            throw new Exception("You must logged to access to use this");
    }

    function profile(){
        return $this->success([
            'firstname'=> $this->user->firstname,
            'lastname'=> $this->user->lastname,
            'username'=> $this->user->username,
            'avatar'=> $this->user->avatar,
            'id'=> $this->user->id,
        ]);
    }   


    function logged(){
        return $this->authHeader();
    }

}