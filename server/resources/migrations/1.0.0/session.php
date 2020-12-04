<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Migrations\Mvc\Model\Migration;

/**
 * Class SessionMigration_100
 */
class SessionMigration_100 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('session', [
                'columns' => [
                    new Column(
                        'id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'notNull' => true,
                            'size' => 11,
                            'first' => true
                        ]
                    ),
                    new Column(
                        'user_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'size' => 11,
                            'after' => 'id'
                        ]
                    ),
                    new Column(
                        'spot_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'notNull' => true,
                            'size' => 11,
                            'after' => 'user_id'
                        ]
                    ),
                    new Column(
                        'street',
                        [
                            'type' => Column::TYPE_TEXT,
                            'size' => 1,
                            'after' => 'spot_id'
                        ]
                    ),
                    new Column(
                        'long',
                        [
                            'type' => Column::TYPE_DOUBLE,
                            'default' => "0",
                            'after' => 'street'
                        ]
                    ),
                    new Column(
                        'lat',
                        [
                            'type' => Column::TYPE_DOUBLE,
                            'default' => "0",
                            'after' => 'long'
                        ]
                    ),
                    new Column(
                        'status',
                        [
                            'type' => Column::TYPE_TINYINTEGER,
                            'default' => "0",
                            'size' => 1,
                            'after' => 'lat'
                        ]
                    ),
                    new Column(
                        'created_at',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'default' => "0",
                            'size' => 11,
                            'after' => 'status'
                        ]
                    ),
                    new Column(
                        'updated_at',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'default' => "0",
                            'size' => 11,
                            'after' => 'created_at'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['id'], 'PRIMARY'),
                    new Index('fk_post_author1_idx', ['user_id'], '')
                ],
                'references' => [
                    new Reference(
                        'fk_post_user_id',
                        [
                            'referencedTable' => 'user',
                            'referencedSchema' => 'surfrider',
                            'columns' => ['user_id'],
                            'referencedColumns' => ['id'],
                            'onUpdate' => 'NO ACTION',
                            'onDelete' => 'NO ACTION'
                        ]
                    )
                ],
                'options' => [
                    'TABLE_TYPE' => 'BASE TABLE',
                    'AUTO_INCREMENT' => '',
                    'ENGINE' => 'InnoDB',
                    'TABLE_COLLATION' => 'utf8_bin'
                ],
            ]
        );
    }

    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {

    }

    /**
     * Reverse the migrations
     *
     * @return void
     */
    public function down()
    {

    }

}
