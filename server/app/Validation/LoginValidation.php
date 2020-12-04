<?php
declare(strict_types=1);
namespace SurfRider\Validation;

use Phalcon\Validation;
use Phalcon\Validation\Validator\StringLength;
use \Phalcon\Validation\Validator\Regex;

class LoginValidation {
    
    public static function validate($data){
        $validation = new Validation();

        $validation->add('username', new StringLength([
            'max' => 30,
            'min' => 3,
            'messageMaximum' => 'The :field is too long',
            'messageMinimum' => 'The :field is too short',
        ]));

        $validation->add('username', new Regex([
            'pattern' => "/^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){0,18}[a-zA-Z0-9]$/",
            'message' => 'The :field is invalid',
        ]));

        $validation->add('password', new StringLength([
            'max' => 30,
            'min' => 3,
            'messageMaximum' => 'The :field is too long',
            'messageMinimum' => 'The :field is too short',
        ]));

        return  $validation->validate($data);
    }
}