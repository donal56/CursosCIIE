<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CurInstructor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-instructor-form">

    <?php $form = ActiveForm::begin(['options' => [ 'id' => 'create-instructor-form' ] ] ); ?>

    <?= $form->field($model, 'ins_titulo')->textInput(['maxlength' => true, ['class' => 'col-md-12']]) ?>

    <?= $form->field($model, 'ins_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ins_paterno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ins_materno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ins_descripcion')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::Button($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'id' => 'createButton']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
