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
            'ins_id' => 'Ins ID',
            'ins_titulo' => 'Ins Titulo',
            'ins_nombre' => 'Ins Nombre',
            'ins_paterno' => 'Ins Paterno',
            'ins_materno' => 'Ins Materno',
            'ins_descripcion' => 'Ins Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurCursos()
    {
        return $this->hasMany(CurCurso::className(), ['cur_fkins_id' => 'ins_id']);
    }
}
