<?php
declare(strict_types=1);
namespace SurfRider\Validation;

use Phalcon\Validation;
use Phalcon\Validation\Validator\StringLength;

class TokenValidation {
    
    public static function validate($data){
        $validation = new Validation();

        $validation->add('token', new StringLength([
            'max' => 300,
            'min' => 30,
            'messageMaximum' => 'The :field is too long',
            'messageMinimum' => 'The :field is too short',
        ]));

        return  $validation->validate($data);
    }
}