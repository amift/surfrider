<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Migrations\Mvc\Model\Migration;

/**
 * Class SessionuseditemMigration_100
 */
class SessionuseditemMigration_100 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('sessionuseditem', [
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
                        'useditem_id',
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
                            'after' => 'useditem_id'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['session_id', 'useditem_id'], 'PRIMARY'),
                    new Index('fk_session_has_useditem_useditem1_idx', ['useditem_id'], ''),
                    new Index('fk_session_has_useditem_session1_idx', ['session_id'], '')
                ],
                'references' => [
                    new Reference(
                        'fk_session_has_useditem_session',
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
                        'fk_session_has_useditem_useditem',
                        [
                            'referencedTable' => 'useditem',
                            'referencedSchema' => 'surfrider',
                            'columns' => ['useditem_id'],
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
