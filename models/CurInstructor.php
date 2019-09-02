<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cur_instructor".
 *
 * @property integer $ins_id
 * @property string $ins_titulo
 * @property string $ins_nombre
 * @property string $ins_paterno
 * @property string $ins_materno
 * @property string $ins_descripcion
 *
 * @property CurCurso[] $curCursos
 */

class CurInstructor extends \yii\db\ActiveRecord
{
    public $ins_fullname = "";
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cur_instructor';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ins_titulo', 'ins_nombre', 'ins_paterno', 'ins_materno'], 'required'],
            [['ins_descripcion'], 'string'],
            [['ins_titulo'], 'string', 'max' => 10],
            [['ins_nombre', 'ins_paterno', 'ins_materno'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ins_id' => 'ID',
            'ins_titulo' => 'Titulo',
            'ins_nombre' => 'Nombre',
            'ins_paterno' => 'Apellido Paterno',
            'ins_materno' => 'Apellido Materno',
            'ins_descripcion' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurCursos()
    {
        return $this->hasMany(CurCurso::className(), ['cur_fkins_id' => 'ins_id']);
    }

    public function afterFind() {
        parent::afterFind();
        $this->ins_fullname =   $this->ins_titulo ." ".
                            $this->ins_nombre ." ".
                            $this->ins_paterno." ".
                            $this->ins_materno;
                   
    }
}
