<?php

namespace SurfRider\Models;

class Auth extends BaseModel
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $user_id;

    /**
     *
     * @var string
     */
    public $token;

    /**
     *
     * @var integer
     */
    public $created_at;

    /**
     *
     * @var integer
     */
    public $expired_at;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("surfrider");
        $this->setSource("auth");
        $this->belongsTo('user_id', 'SurfRider\Models\User', 'id', ['alias' => 'User']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Auth[]|Auth|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Auth|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }


    /**
     * Generate a token
     */
    public function randomToken(){
        $random = new \Phalcon\Security\Random();

        $this->token = $random->uuid() . $random->base64(30);
        return $this->token;
    }
}
