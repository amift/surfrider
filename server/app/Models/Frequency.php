<?php

namespace SurfRider\Models;

class Frequency extends BaseModel
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
    public $boat_id;

    /**
     *
     * @var integer
     */
    public $bathers;

    /**
     *
     * @var integer
     */
    public $nautical;

    /**
     *
     * @var integer
     */
    public $boats;

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

        $this->setSource("frequency");
        $this->hasMany('id', 'SurfRider\Models\Sessionfrequancy', 'frequency_id', ['alias' => 'Sessionfrequancy']);
        $this->belongsTo('boat_id', 'SurfRider\Models\Entity', 'id', ['alias' => 'Entity']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Frequency[]|Frequency|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Frequency|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
