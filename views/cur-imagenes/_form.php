<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use iutbay\yii2kcfinder\KCFinderInputWidget;

/* @var $this yii\web\View */
/* @var $model app\models\CurImagenes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-imagenes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ima_url')->widget(KCFinderInputWidget::className(), [
        'buttonLabel' =>'Subir Imagen',
        'modalTitle' =>'Imagenes',
        'kcfOptions' => [
        	 'uploadURL' =>'@web/uploads/img',
        	 'uploadDir' => '@app/web/uploads/img',
        ],
    ]);?>

    <?= $form->field($model, 'ima_fkcurso')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
