<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurParticipante */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="cur-participante-form">

    <?php $form = ActiveForm::begin(); ?>

<div class="row"> 
    <?= $form->field($model, 'par_nombre',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_paterno',['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_materno',['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>
</div>
    
<div class="row"> 
    <?= $form->field($model, 'par_genero',['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_edad',['options' => ['class' => 'form-group col-sm-2']])->textInput() ?>
    
    <?= $form->field($model, 'par_telefono',['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_procedencia',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>
</div>

<div class="row"> 
    <?= $form->field($model, 'par_email',['options' => ['class' => 'form-group col-sm-8']])->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'par_pagado',['options' => ['class' => 'form-group col-sm-4']])->textInput() ?>
</div>

<div class="row">
    <?= $form->field($model, 'par_observaciones',['options' => ['class' => 'form-group col-sm-12']])->textarea(['rows' => 2]) ?>  
</div>







    <?php /* $form->field($model, 'par_fkcurso')->textInput() */?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?= $this->registerCssFile("/css/cur-form.css");   ?>