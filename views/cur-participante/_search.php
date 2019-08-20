<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurParticipanteSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-participante-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'par_id') ?>

    <?= $form->field($model, 'par_nombre') ?>

    <?= $form->field($model, 'par_paterno') ?>

    <?= $form->field($model, 'par_materno') ?>

    <?= $form->field($model, 'par_genero') ?>

    <?php // echo $form->field($model, 'par_telefono') ?>

    <?php // echo $form->field($model, 'par_email') ?>

    <?php // echo $form->field($model, 'par_edad') ?>

    <?php // echo $form->field($model, 'par_procedencia') ?>

    <?php // echo $form->field($model, 'par_pagado') ?>

    <?php // echo $form->field($model, 'par_observaciones') ?>

    <?php // echo $form->field($model, 'par_fkcurso') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
