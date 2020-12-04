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
    public function onConstruct(){

    }
    function start(){
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

}