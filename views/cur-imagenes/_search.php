<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurImagenesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-imagenes-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'ima_id') ?>

    <?= $form->field($model, 'ima_url') ?>

    <?= $form->field($model, 'ima_activo') ?>

    <?= $form->field($model, 'ima_fkcurso') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
