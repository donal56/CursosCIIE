<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurInstructorSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-instructor-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'ins_id') ?>

    <?= $form->field($model, 'ins_titulo') ?>

    <?= $form->field($model, 'ins_nombre') ?>

    <?= $form->field($model, 'ins_paterno') ?>

    <?= $form->field($model, 'ins_materno') ?>

    <?php // echo $form->field($model, 'ins_descripcion') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
