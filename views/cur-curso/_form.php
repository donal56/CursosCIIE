<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurCurso */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-curso-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cur_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cur_dirigido')->textInput() ?>

    <?= $form->field($model, 'cur_cupo')->textInput() ?>

    <?= $form->field($model, 'cur_fechainicio')->textInput() ?>

    <?= $form->field($model, 'cur_fechafinal')->textInput() ?>

    <?= $form->field($model, 'cur_presentacion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_objetivo')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_requisitos')->textInput() ?>

    <?= $form->field($model, 'cur_requerimientos')->textInput() ?>

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

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
