<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use unclead\multipleinput\MultipleInput;

/* @var $this yii\web\View */
/* @var $model app\models\CurCurso */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-curso-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cur_nombre')->textInput(['maxlength' => true]) ?>

    <?php
        echo $form->field($model, 'cur_dirigido')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, // show add button in the header
        ]);
    ?>

    <?= $form->field($model, 'cur_cupo')->textInput() ?>

    <?= $form->field($model, 'cur_fechainicio')->textInput() ?>

    <?= $form->field($model, 'cur_fechafinal')->textInput() ?>

    <?= $form->field($model, 'cur_presentacion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_objetivo')->textarea(['rows' => 6]) ?>

    <?php
        echo $form->field($model, 'cur_requisitos')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, // show add button in the header
        ]);
    ?>


    <?php
        echo $form->field($model, 'cur_requerimientos')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, // show add button in the header
        ]);
    ?>

    <?= $form->field($model, 'cur_duracion')->textInput() ?>

    <?= $form->field($model, 'cur_horario')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_costo')->textInput() ?>

    <?= $form->field($model, 'cur_formaPago')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_obtendra')->textInput() ?>

    <?= $form->field($model, 'cur_fkins_id')->textInput() ?>

    <?= $form->field($model, 'cur_temario')->textInput() ?>

    <?= $form->field($model, 'cur_procedimiento')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_contacto')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_observaciones')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_archivo')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
