<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use unclead\multipleinput\MultipleInput;
use kartik\date\DatePicker;
use dosamigos\ckeditor\CKEditor;
use iutbay\yii2kcfinder\KCFinderInputWidget;
use iutbay\yii2kcfinder\KCFinder;
use app\models\CurInstructor;
use yii\bootstrap\Modal;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\CurCurso */
/* @var $form yii\widgets\ActiveForm */
?>
<br>
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

    <?= $form->field($model, 'cur_horario')->textarea(['rows' => 6, 'placeholder' => 'En este apartado puedes agregar la fecha y número de sesiones y el horario de ellas.']); ?>

   
    <?php
        echo $form->field($model, 'cur_formaPago')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, 
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

    <?= $form->field($model, 'cur_presentacion')->textarea(['rows' => 6, 'placeholder' => 'Este texto será el que se mostrara en la pantalla principal.']) ?>

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
            'sortable'  => true, // show add button in the header
            'allowEmptyList'  => true,
        ]);
    ?>

    <?php
        echo $form->field($model, 'cur_obtendra')->widget(MultipleInput::className(), [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, 
            'sortable'  => true,
            'allowEmptyList'  => true,
        ]);
    ?>


    <?php $button= Html::a('', '#Instructor', [
								'id' => 'abrirModal',
								'class' => 'btn btn-success glyphicon glyphicon-plus',
								'style' => 'margin-bottom: 6px',
								'data-toggle' => 'modal',
								'data-target' => '#modal',
								'data-url' => Url::to(['cur-instructor/ajax_create']),
								'data-pjax' => '0',
							]); ?>

    <?= $form->field($model, 'cur_fkins_id', [  'parts' => ['{button}' => $button],
                                                'template' => '{label}<br>{input}{button}<br>{hint}{error}<br>'])
        ->dropDownList(ArrayHelper::map(CurInstructor::find()->all(),'ins_id','ins_fullname'), ['id'=> 'dropdown_ins', 'class' => 'form-control', 'style' => 'width: calc(100% - 50px); margin-right: 5px; display: inline-block']) ?>        


    <?php 
    Modal::begin([
        'id'     =>'modal',
        'clientOptions' => ['backdrop' => 'static'],
        'header' => '<h4 class="modal-title">Rellene</h4>',
        'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Cerrar</a>',]);
        echo "<div style='text-align:center'><img width= '40%' src='/img/loading.gif'></div>";
    Modal::end();
    ?>


    <?= $form->field($model, 'cur_temario')->widget(CKEditor::className(), [
        'options' => ['rows' => 6],
    ]) ?>

    <?php
        echo $form->field($model, 'cur_procedimiento')->widget(MultipleInput::className(), 
        [
            'enableError' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER, 
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
        'kcfinder' => true,
    ])->label('En caso de necesitar agregar informacion extra, puede agregarlo en el siguiente espacio:') ?>

    <?= $form->field($model, 'cur_archivo')->widget(KCFinderInputWidget::className(), [
        'buttonLabel' =>'Subir Archivo',
        'modalTitle' =>'Descargas',
    ]);
    ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?= $this->registerJsFile('/assets/ckeditor/ckeditor.js');  ?>
<?php $this->registerJsFile("/js/modalInstructor.js", ['depends' => 'yii\web\JqueryAsset']);    ?>