<?php
declare(strict_types=1);
namespace SurfRider\Controllers;

use Exception;
use SurfRider\Models\Session;

class SessionController extends AuthMiddleware
{
    public function onConstruct()
    {
        parent::onConstruct();

        if (!$this->isLogged())
            throw new Exception("You must logged to access to use this");
    }

    function start(){
        $session = new Session();
        $session->user_id = $this->user->id;
        $session->created_at = time();
        // $session->spot_id = 


        return 'ok';
    }   


    function logged(){
        return $this->authHeader();
    }

}