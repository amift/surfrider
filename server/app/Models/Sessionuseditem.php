<?php

namespace SurfRider\Models;

class Sessionuseditem extends BaseModel
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
    public $useditem_id;

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
        $this->setSchema("surfrider");
        $this->setSource("sessionuseditem");
        $this->belongsTo('session_id', 'SurfRider\Models\Session', 'id', ['alias' => 'Session']);
        $this->belongsTo('useditem_id', 'SurfRider\Models\Useditem', 'id', ['alias' => 'Useditem']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Sessionuseditem[]|Sessionuseditem|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Sessionuseditem|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
