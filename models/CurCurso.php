<?php

namespace app\models;

use Yii;
use yii\web\NotFoundHttpException;
use \yii\helpers\Json;
use yii\helpers\Url;

/**
 * This is the model class for table "cur_curso".
 *
 * @property integer $cur_id
 * @property string $cur_nombre
 * @property string $cur_dirigido
 * @property integer $cur_cupo
 * @property string $cur_fechainicio
 * @property string $cur_fechafinal
 * @property string $cur_presentacion
 * @property string $cur_objetivo
 * @property string $cur_requisitos
 * @property string $cur_requerimientos
 * @property integer $cur_duracion
 * @property string $cur_horario
 * @property double $cur_costo
 * @property string $cur_formaPago
 * @property string $cur_obtendra
 * @property integer $cur_fkins_id
 * @property string $cur_temario
 * @property string $cur_procedimiento
 * @property string $cur_observaciones
 * @property string $cur_archivo
 *
 * @property CurInstructor $curFkins
 * @property CurImagenes[] $curImagenes
 * @property CurParticipante[] $curParticipantes
 */
class CurCurso extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cur_curso';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cur_nombre'], 'required'],
            [['cur_dirigido', 'cur_presentacion', 'cur_objetivo', 'cur_requisitos', 'cur_requerimientos', 'cur_horario', 'cur_formaPago', 'cur_obtendra', 'cur_temario', 'cur_procedimiento', 'cur_contacto', 'cur_observaciones'], 'string'],
            [['cur_cupo', 'cur_duracion', 'cur_fkins_id'], 'integer'],
            [['cur_fechainicio', 'cur_fechafinal'], 'safe'],
            [['cur_costo'], 'number'],
            [['cur_nombre'], 'string', 'max' => 150],
            [['cur_archivo'], 'string', 'max' => 255],
            [['cur_fkins_id'], 'exist', 'skipOnError' => true, 'targetClass' => CurInstructor::className(), 'targetAttribute' => ['cur_fkins_id' => 'ins_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cur_id' => 'ID',
            'cur_nombre' => 'Nombre',
            'cur_dirigido' => 'Dirigido',
            'cur_cupo' => 'Cupo',
            'cur_fechainicio' => 'Fecha de inicio',
            'cur_fechafinal' => 'Fecha final',
            'cur_presentacion' => 'Presentacion',
            'cur_objetivo' => 'Objetivo',
            'cur_requisitos' => 'Requisitos',
            'cur_requerimientos' => 'Requerimientos',
            'cur_duracion' => 'Duracion',
            'cur_horario' => 'Horario',
            'cur_costo' => 'Costo',
            'cur_formaPago' => 'Forma de Pago',
            'cur_obtendra' => 'Obtendrá',
            'cur_fkins_id' => 'Instructor',
            'cur_temario' => 'Temario',
            'cur_procedimiento' => 'Procedimiento',
            'cur_contacto' => 'Contacto',
            'cur_observaciones' => 'Observaciones',
            'cur_archivo' => 'Archivo adjunto',
        ];
    }

   /* public function afterFind() {
        parent::afterFind();
        $this->cur_dirigido = Json::decode($this->cur_dirigido);
        $this->cur_requisitos = Json::decode($this->cur_requisitos);
        $this->cur_requerimientos = Json::decode($this->cur_requerimientos);
    }*/

    /*public function beforeGuardar() {
        $this->cur_dirigido = Json::encode($this->cur_dirigido);
        $this->cur_requisitos = Json::encode($this->cur_requisitos);
        $this->cur_requerimientos = Json::encode($this->cur_requerimientos);
    }
    */
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurFkins()
    {
        return $this->hasOne(CurInstructor::className(), ['ins_id' => 'cur_fkins_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurImagenes()
    {
        return $this->hasMany(CurImagenes::className(), ['ima_fkcurso' => 'cur_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurParticipantes()
    {
        return $this->hasMany(CurParticipante::className(), ['par_fkcurso' => 'cur_id']);
    }

    public function getNombre()
    {
        return $this->cur_nombre;
    }

    public function getDirigido()
    {
        return json_decode($this->cur_dirigido, true);
    }
    
    public function getImagenes()
    {
        $modeloImagenes= $this->curImagenes;
        $arr= array();

        for($i= 0; $i < sizeOf($modeloImagenes); $i++)
        {
            $arr[]= $modeloImagenes[$i]->ima_url;
        }

        return $arr;
    }

    public function getPresentacion()
    {
        return nl2br($this->cur_presentacion);
    }

    public function getObjetivo()
    {
        return nl2br($this->cur_objetivo);
    }

    public function getRequisitos()
    {
        return json_decode($this->cur_requisitos, true);
    }

    public function getRequerimientos()
    {
        return json_decode($this->cur_requerimientos, true);
    }
    public function getHorario()
    {
        return nl2br($this->cur_horario);
    }

    public function getCosto()
    {
        return  '$' . number_format($this->cur_costo, 2);
    }
    public function getCupo()
    {
        return ($this->cur_cupo . " PERSONAS");
    }
    public function getDuracion()
    {
        return ($this->cur_duracion . " HORAS");
    }

    public function getFormaPago()
    {
        return json_decode($this->cur_formaPago, true);
    }

    public function getObtendra()
    {
        return json_decode($this->cur_obtendra, true);
    }

    public function getInstructor()
    {
        $model = CurInstructor::findOne((int)$this->cur_fkins_id);
        return mb_strtoupper($model->ins_titulo . " " .  $model->ins_nombre . " " .  $model->ins_paterno . " " .  $model->ins_materno);
    }

    public function getDescripcionInstructor()
    {
        $model = CurInstructor::findOne((int)$this->cur_fkins_id);
        return nl2br($model->ins_descripcion);
    }

    // public function getModulos()
    // {
    //     $modulos= array();
    //     $arr= json_decode($this->cur_temario, true);

    //     foreach($arr as $key=>$value)
    //     {
    //         $modulos[]= $key;
    //     }

    //     return $modulos;
    // }

    public function getProcedimiento()
    {
        return json_decode($this->cur_procedimiento, true);
    }

    public function getTemario()
    {
        return $this->cur_temario;
    }

    public function getContacto()
    {
        return nl2br($this->cur_contacto);
    }

    public function getURLArchivo()
    {
        return Url::base(true) . $this->cur_archivo;
    }
    
    public function getInscritos()
    {
        if (($model = CurParticipante::findAll(['par_fkcurso' => $this->cur_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function getCountInsctritos(){
        return count($this->getInscritos());
    }

    public function getCupoRestante(){
        return ( $this->cur_cupo - $this->getCountInsctritos());
    }

    public function getCupoReservados(){
        return ( count(CurParticipante::findAll(['par_fkcurso' => $this->cur_id,'par_pagado' => 0])) );
    }

    public static function getCurso()
    {
        if (($model = CurCurso::find()->one()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}