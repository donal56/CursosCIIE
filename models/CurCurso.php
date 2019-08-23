<?php

namespace app\models;

use Yii;

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
 * @property string $cur_contacto
 * @property string $cur_observaciones
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
        ];
    }

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

    public function getInscritos()
    {
        if (($model = CurParticipante::findAll(['par_fkcurso' => $this->cur_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function getCupoRestante(){
        return ( $this->cur_cupo - count($this->getInscritos()) );
    }
    public function getCountInsctritos(){
        return count($this->getInscritos());
    }



}
