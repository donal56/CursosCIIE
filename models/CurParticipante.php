<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cur_participante".
 *
 * @property integer $par_id
 * @property string $par_nombre
 * @property string $par_paterno
 * @property string $par_materno
 * @property string $par_genero
 * @property string $par_telefono
 * @property string $par_email
 * @property integer $par_edad
 * @property string $par_procedencia
 * @property double $par_pagado
 * @property string $par_observaciones
 * @property integer $par_fkcurso
 *
 * @property CurCurso $parFkcurso
 */
class CurParticipante extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cur_participante';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['par_nombre', 'par_paterno', 'par_materno', 'par_genero', 'par_edad', 'par_fkcurso'], 'required'],
            [['par_edad', 'par_fkcurso'], 'integer'],
            [['par_pagado'], 'number'],
            [['par_observaciones'], 'string'],
            [['par_nombre', 'par_paterno', 'par_materno', 'par_email'], 'string', 'max' => 50],
            [['par_genero'], 'string', 'max' => 1],
            [['par_telefono'], 'string', 'max' => 20],
            [['par_procedencia'], 'string', 'max' => 100],
            [['par_fkcurso'], 'exist', 'skipOnError' => true, 'targetClass' => CurCurso::className(), 'targetAttribute' => ['par_fkcurso' => 'cur_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'par_id' => 'ID',
            'par_nombre' => 'Nombre',
            'par_paterno' => 'Apellido Paterno',
            'par_materno' => 'Apellido Materno',
            'par_genero' => 'Genero',
            'par_telefono' => 'Telefono',
            'par_email' => 'Email',
            'par_edad' => 'Edad',
            'par_procedencia' => 'Procedencia',
            'par_pagado' => 'Pagado',
            'par_observaciones' => 'Observaciones',
            'par_fkcurso' => 'Curso',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParFkcurso()
    {
        return $this->hasOne(CurCurso::className(), ['cur_id' => 'par_fkcurso']);
    }

    public function getImage()
    {
        return ($this->par_genero == "M") ? "/img/CIIE/women.jpg" :"/img/CIIE/man.jpg" ;
    }
}
