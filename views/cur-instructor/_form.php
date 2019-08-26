<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurInstructor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-instructor-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ins_titulo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ins_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ins_paterno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ins_materno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ins_descripcion')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>