<?php

namespace SurfRider\Models;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Regex;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Uniqueness;

class User extends BaseModel
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $username;

    /**
     *
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $password;

    /**
     *
     * @var string
     */
    public $firstname;

    /**
     *
     * @var string
     */
    public $lastname;

    /**
     *
     * @var string
     */
    public $avatar;

    /**
     *
     * @var string
     */
    public $bio;

    /**
     *
     * @var string
     */
    public $country;

    /**
     *
     * @var string
     */
    public $status;

    /**
     *
     * @var integer
     */
    public $created_at;

    /**
     *
     * @var string
     */
    public $created_ip;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        $validator->add('username', new Uniqueness([
            'model' => new self,
            'message' => 'The :field already used',
        ]));

        $validator->add('email', new Uniqueness([
            'model' => new self,
            'message' => 'The :field already used',
        ]));

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        $validator->add('username', new Regex([
            'pattern' => "/^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$/",
            'message' => 'The :field is invalid',
        ]));
        
        $validator->add('password', new StringLength([
            'max' => 30,
            'min' => 3,
            'messageMaximum' => 'The :field is too long',
            'messageMinimum' => 'The :field is too short',
        ]));
            

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("surfrider");
        $this->setSource("user");
        $this->hasMany('id', 'SurfRider\Models\Auth', 'user_id', ['alias' => 'Auth']);
        $this->hasMany('id', 'SurfRider\Models\Session', 'user_id', ['alias' => 'Session']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return User[]|User|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return User|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }


    /**
     * Before Save Hash Password
     */
    public function beforeCreate(){
        parent::beforeCreate();
        
        $this->password = $this->getDi()->get('security')->hash($this->password);
    }
}
