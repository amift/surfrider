<?php
declare(strict_types=1);
namespace SurfRider\Controllers;

use Exception;
use Phalcon\Filter;
use SurfRider\Models\Auth;
use SurfRider\Models\User;
use SurfRider\Validation\LoginValidation;

class AuthController extends BaseController
{
    function login(){
        $username = $this->request->getPost('username', Filter::FILTER_STRING);
        $password = $this->request->getPost('password', Filter::FILTER_STRING);    

        $validate = LoginValidation::validate(['username'=>$username,'password'=>$password]);
        if (count($validate)){
            foreach($validate as $error)
                throw new Exception($error->getMessage(),401);
        }

        $user = User::findFirst([
            'username = ?0',
            'bind'=> [$username]
        ]);

        if (!$user) 
            throw new Exception("Invalid Credentials",401);

        if (!$this->security->checkHash($password, $user->password))
            throw new Exception("Invalid Credentials",401);

        $this->security->hash(strval(rand()));
     
        return $this->generateSession($user);
    }
    function register(){
        $username = $this->request->getPost('username', Filter::FILTER_STRING);
        $password = $this->request->getPost('password', Filter::FILTER_STRING);    
        $email  = $this->request->getPost('email', Filter::FILTER_STRING);    

        $data = ['username'=>$username,'password'=>$password,'email'=>$email];

        $validate = LoginValidation::validate($data);
        if (count($validate)){
            foreach($validate as $error)
            throw new Exception($error->getMessage(),401);
        }

        $user = new User();

        foreach($data as $key => $val)
            $user->$key = $val;

        if (!$user->save())
            foreach($user->getMessages() as $error)
                throw new Exception($error->getMessage(),401);

        return $this->generateSession($user);
    }   


    private function generateSession($user){
        $session = Auth::findFirstByUser_id($user->id) ?: new Auth;
        $session->randomToken();
        $session->user_id = $user->id;
        $session->created_at = time();
        $session->expired_at = time() + 60 * 60 * 24 * 15;
        
        if ($session->save())
            return $this->success([
                'token'=> $session->token,
                'expired_at'=> $session->expired_at
            ])->send();

        throw new Exception("Somthig wrong ! Please contact support",401);
    }
}