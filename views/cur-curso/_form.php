<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use unclead\multipleinput\MultipleInput;
use kartik\date\DatePicker;
use dosamigos\ckeditor\CKEditor;
use iutbay\yii2kcfinder\KCFinderInputWidget;
use app\models\CurInstructor;

/* @var $this yii\web\View */
/* @var $model app\models\CurCurso */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cur-curso-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cur_nombre')->textInput(['maxlength' => true]) ?>

<div class="row"> 

    <?php
        echo $form->field($model, 'cur_fechainicio', ['options' => ['class' => 'form-group col-sm-3']]) -> widget(DatePicker::classname(), 
        [
            'language' => 'es',
            'removeButton' => false,
            'pluginOptions' => [
                'todayHighlight' => true,
                'autoclose' => true, 
                'format' => 'yyyy-mm-dd']
        ]); 
    ?>  

    <?php
        echo $form->field($model, 'cur_fechafinal', ['options' => ['class' => 'form-group col-sm-3']]) -> widget(DatePicker::classname(), 
        [
            'language' => 'es',
            'removeButton' => false,
            'pluginOptions' => [
                'todayHighlight' => true,
                'autoclose' => true, 
                'format' => 'yyyy-mm-dd']
        ]); 
    ?>

    <?= $form->field($model, 'cur_duracion', ['options' => ['class' => 'form-group col-sm-2']])->textInput() ?>

    <?= $form->field($model, 'cur_cupo', ['options' => ['class' => 'form-group col-sm-2']])->textInput() ?>
    
    <?= $form->field($model, 'cur_costo', ['options' => ['class' => 'form-group col-sm-2']])->textInput() ?>

</div>

    <?= $form->field($model, 'cur_horario')->textarea(['rows' => 6]) ?>

   
    <?php
        echo $form->field($model, 'cur_formaPago')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, 
            'sortable'  => true,
            'sortable'  => true, // show add button in the header
            'allowEmptyList'  => true,
        ]);
    ?>

    <?php
        echo $form->field($model, 'cur_dirigido')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, // show add button in the header
            'sortable'  => true, 
            'allowEmptyList'  => true,
        ]);
    ?>

    <?= $form->field($model, 'cur_presentacion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_objetivo')->textarea(['rows' => 6]) ?>

    <?php
        echo $form->field($model, 'cur_requisitos')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER,
            'sortable'  => true, 
            'allowEmptyList'  => true,
        ]);
    ?>


    <?php
        echo $form->field($model, 'cur_requerimientos')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, 
            'sortable'  => true,
            'sortable'  => true, // show add button in the header
            'allowEmptyList'  => true,
        ]);
    ?>

    <?php
        echo $form->field($model, 'cur_obtendra')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, 
            'sortable'  => true,
            'sortable'  => true, // show add button in the header
            'allowEmptyList'  => true,
        ]);
    ?>

    <?= $form->field($model, 'cur_fkins_id')->dropDownList(ArrayHelper::map(CurInstructor::find()->all(),
                                                                            'ins_id','ins_fullname')) ?>

 
    <?= $form->field($model, 'cur_temario')->widget(CKEditor::className(), [
        'options' => ['rows' => 6],
    ]) ?>

    <?php
        echo $form->field($model, 'cur_procedimiento')->widget(MultipleInput::className(), 
        [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, 
            'sortable'  => true,
            'sortable'  => true, // show add button in the header
            'allowEmptyList'  => true,
            'columns' => 
            [
                [
                    'name'  => 'cur_procedimiento',
                    'type' => 'textarea',
                    'enableError' => true,
                ],
            ],
        ]);
    ?>


    <?= $form->field($model, 'cur_contacto')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cur_observaciones')->widget(CKEditor::className(), [
        'options' => ['rows' => 6],
    ])->label('En caso de necesitar agregar informacion extra, puede agregarlo en el siguiente espacio:') ?>

    <?= $form->field($model, 'cur_archivo')->widget(KCFinderInputWidget::className(), [
    'multiple' => true,
    'buttonLabel' =>'Subir Archivo',
    ]);
    ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?= $this->registerJsFile('/assets/ckeditor/ckeditor.js'); ?>