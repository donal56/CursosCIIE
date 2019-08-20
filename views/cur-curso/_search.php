<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurCursoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-curso-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cur_id') ?>

    <?= $form->field($model, 'cur_nombre') ?>

    <?= $form->field($model, 'cur_dirigido') ?>

    <?= $form->field($model, 'cur_cupo') ?>

    <?= $form->field($model, 'cur_fechainicio') ?>

    <?php // echo $form->field($model, 'cur_fechafinal') ?>

    <?php // echo $form->field($model, 'cur_presentacion') ?>

    <?php // echo $form->field($model, 'cur_objetivo') ?>

    <?php // echo $form->field($model, 'cur_requisitos') ?>

    <?php // echo $form->field($model, 'cur_requerimientos') ?>

    <?php // echo $form->field($model, 'cur_duracion') ?>

    <?php // echo $form->field($model, 'cur_horario') ?>

    <?php // echo $form->field($model, 'cur_costo') ?>

    <?php // echo $form->field($model, 'cur_formaPago') ?>

    <?php // echo $form->field($model, 'cur_obtendra') ?>

    <?php // echo $form->field($model, 'cur_fkins_id') ?>

    <?php // echo $form->field($model, 'cur_temario') ?>

    <?php // echo $form->field($model, 'cur_procedimiento') ?>

    <?php // echo $form->field($model, 'cur_contacto') ?>

    <?php // echo $form->field($model, 'cur_observaciones') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
