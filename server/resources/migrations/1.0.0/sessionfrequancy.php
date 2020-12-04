<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Migrations\Mvc\Model\Migration;

/**
 * Class SessionfrequancyMigration_100
 */
class SessionfrequancyMigration_100 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('sessionfrequancy', [
                'columns' => [
                    new Column(
                        'session_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'notNull' => true,
                            'size' => 11,
                            'first' => true
                        ]
                    ),
                    new Column(
                        'frequency_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'notNull' => true,
                            'size' => 11,
                            'after' => 'session_id'
                        ]
                    ),
                    new Column(
                        'created_at',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'default' => "0",
                            'size' => 11,
                            'after' => 'frequency_id'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['session_id', 'frequency_id'], 'PRIMARY'),
                    new Index('fk_session_has_frequency_frequency1_idx', ['frequency_id'], ''),
                    new Index('fk_session_has_frequency_session1_idx', ['session_id'], '')
                ],
                'references' => [
                    new Reference(
                        'fk_session_has_frequency_session',
                        [
                            'referencedTable' => 'session',
                            'referencedSchema' => 'surfrider',
                            'columns' => ['session_id'],
                            'referencedColumns' => ['id'],
                            'onUpdate' => 'NO ACTION',
                            'onDelete' => 'NO ACTION'
                        ]
                    ),
                    new Reference(
                        'fk_session_has_frequency_frequency',
                        [
                            'referencedTable' => 'frequency',
                            'referencedSchema' => 'surfrider',
                            'columns' => ['frequency_id'],
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
