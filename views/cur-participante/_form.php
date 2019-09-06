<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\CurCurso;

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
    <?= $form->field($model, 'par_genero',['options' => ['class' => 'form-group col-sm-2']])->dropDownList(['H' => 'Hombre', 'M' => 'Mujer'], ['prompt' => 'Seleccione Uno' ]); ?>

    <?= $form->field($model, 'par_edad',['options' => ['class' => 'form-group col-sm-2']])->textInput() ?>
    
    <?= $form->field($model, 'par_telefono',['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'par_procedencia',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>
</div>

<div class="row"> 
    <?= $form->field($model, 'par_email',['options' => 
                                            ['class' => (!Yii::$app->user->isGuest ? 
                                                'form-group col-sm-8':'form-group col-sm-6'
                                            )]
                                        ])->textInput(['maxlength' => true]) ?>

    <?php echo (!Yii::$app->user->isGuest ? $form->field($model, 'par_pagado',['options' => ['class' => 'form-group col-sm-4']])->textInput() : '') ?>
</div>

<div class="row">
    <?= $form->field($model, 'par_enteraste',['options' => ['class' => 'form-group col-sm-12']])->textarea(['rows' => 2]) ?>  
</div>

<div class="row">
    <?php echo (!Yii::$app->user->isGuest ? $form->field($model, 'par_observaciones',['options' => ['class' => 'form-group col-sm-12']])->textarea(['rows' => 2]) : '') ?>  
</div>

    <?= $form->field($model, 'par_fkcurso')->hiddenInput(['value'=>CurCurso::getCurso()->cur_id])->label(false); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Registrar' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Regresar', Yii::$app->request->referrer ?: Yii::$app->homeUrl, ['class' => 'btn btn-danger']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?= $this->registerCssFile("/css/cur-form.css");   ?>