<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cur_imagenes".
 *
 * @property integer $ima_id
 * @property string $ima_url
 * @property integer $ima_activo
 * @property integer $ima_fkcurso
 *
 * @property CurCurso $imaFkcurso
 */
class CurImagenes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cur_imagenes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ima_url', 'ima_activo', 'ima_fkcurso'], 'required'],
            [['ima_activo', 'ima_fkcurso'], 'integer'],
            [['ima_url'], 'string', 'max' => 100],
            [['ima_fkcurso'], 'exist', 'skipOnError' => true, 'targetClass' => CurCurso::className(), 'targetAttribute' => ['ima_fkcurso' => 'cur_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ima_id' => 'ID',
            'ima_url' => 'Url',
            'ima_activo' => 'Activo',
            'ima_fkcurso' => 'Curso',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getImaFkcurso()
    {
        return $this->hasOne(CurCurso::className(), ['cur_id' => 'ima_fkcurso']);
    }
}
