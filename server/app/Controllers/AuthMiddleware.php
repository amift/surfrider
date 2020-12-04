<?php
declare(strict_types=1);

namespace SurfRider\Controllers;

use SurfRider\Models\Auth;
use SurfRider\Models\User;
use SurfRider\Validation\TokenValidation;

class AuthMiddleware extends BaseController
{
    protected $user;
    protected $auth = false;
    protected $auth_token;

    public function onConstruct(){
        $this->authHeader();
    }

    public function authHeader(){
        $token = $this->request->getHeader('token');

        if (count(TokenValidation::validate(['token'=>$token])) != 0) return;

        $session = Auth::findFirstByToken($token);

        if (!$session || $session->expired_at < time()) return;

        $this->auth = true;
        $this->auth_token = $token;
        $this->user = User::findFirstById($session->user_id);

        return $this->user;
    }

    protected function isLogged() : bool
    {
        return $this->auth === true;
    }
}