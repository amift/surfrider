<?php

namespace SurfRider\Models;

class Session extends BaseModel
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
     * @var integer
     */
    public $spot_id;

    /**
     *
     * @var string
     */
    public $street;

    /**
     *
     * @var string
     */
    public $long;

    /**
     *
     * @var string
     */
    public $lat;

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
     * @var integer
     */
    public $updated_at;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {

        $this->setSource("session");
        $this->hasMany('id', 'SurfRider\Models\Sessionfrequancy', 'session_id', ['alias' => 'Sessionfrequancy']);
        $this->hasMany('id', 'SurfRider\Models\Sessionuseditem', 'session_id', ['alias' => 'Sessionuseditem']);
        $this->belongsTo('user_id', 'SurfRider\Models\User', 'id', ['alias' => 'User']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Session[]|Session|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Session|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
