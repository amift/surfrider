<?php

namespace SurfRider\Models;

class Sessionfrequancy extends BaseModel
{

    /**
     *
     * @var integer
     */
    public $session_id;

    /**
     *
     * @var integer
     */
    public $frequency_id;

    /**
     *
     * @var integer
     */
    public $created_at;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {

        $this->setSource("sessionfrequancy");
        $this->belongsTo('session_id', 'SurfRider\Models\Session', 'id', ['alias' => 'Session']);
        $this->belongsTo('frequency_id', 'SurfRider\Models\Frequency', 'id', ['alias' => 'Frequency']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Sessionfrequancy[]|Sessionfrequancy|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Sessionfrequancy|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
