<?php

namespace app\models;

use Yii;
use yii\web\NotFoundHttpException;

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
 * @property string $par_enteraste
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
            ['par_pagado','compare', 'compareValue' => CurCurso::findOne(['cur_id' => (isset($_GET['cid']) ? $_GET['cid'] : $this->par_fkcurso)])->cur_costo, 'operator' => '<=','message'=>Yii::t('app','Se ha excedido el pago máximo.')],
            //para invitados no pueden pagar
            ['par_pagado','compare', 'compareValue' => '0', 'operator' => '<=','message'=> 'Acuda a la oficina correspondiente para registrar su pago','on' => 'unlogged'],
            [['par_observaciones', 'par_enteraste'], 'string'],
            [['par_nombre', 'par_paterno', 'par_materno'], 'string', 'max' => 50],
            [['par_email'], 'string', 'max' => 100],
            [['par_email'], 'email'],
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
            'par_genero' => 'Género',
            'par_telefono' => 'Teléfono',
            'par_email' => 'Correo Electrónico',
            'par_edad' => 'Edad',
            'par_procedencia' => 'Institución de Procedencia',
            'par_pagado' => 'Cantidad pagada',
            'par_observaciones' => 'Observaciones',
            'par_enteraste' => '¿Cómo te enteraste del curso?',
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
        return ($this->par_genero == "M") ? "/img/women.jpg" :"/img/man.jpg" ;
    }
    public function getGenero()
    {
        return ($this->par_genero == "M" ? "Mujer" : "Hombre");
    }

    public function getNombre()
    {
        return $this->par_nombre . " " . $this->par_paterno . " " . $this->par_materno;
    }

    public function getPagado()
    {
        return '$' . \number_format($this->par_pagado);
    }

     public function getCurso()
    {
        $model = CurCurso::findOne($this->par_fkcurso);
        return mb_strtoupper($model->cur_nombre);
    }

}
