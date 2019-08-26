<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurImagenes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-imagenes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ima_url')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ima_activo')->textInput() ?>

    <?= $form->field($model, 'ima_fkcurso')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>