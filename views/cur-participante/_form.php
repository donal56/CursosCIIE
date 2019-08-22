<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurParticipante */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-participante-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'par_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_paterno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_materno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_genero')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_telefono')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_edad')->textInput() ?>

    <?= $form->field($model, 'par_procedencia')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_pagado')->textInput() ?>

    <?= $form->field($model, 'par_observaciones')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'par_fkcurso')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
