<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\widgets\Pjax;
use iutbay\yii2kcfinder\KCFinderInputWidget;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CurImagenesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Imágenes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-imagenes-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php Pjax::begin(); ?>    <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                [
                    'class' => 'yii\grid\SerialColumn',
                    'contentOptions' => ['style' => 'vertical-align: middle; text-align: center'],
                ],
                //'ima_id',
                [
                    'label' => 'Imagen',
                    'attribute' => 'ima_url',
                    'format' => 'raw',
                    'value' => function ($data) 
                    {
                        return Html::img($data->ima_url, ['alt'=>'Imagen del curso', 'height'=>'200']);
                    },
                    'options' => ['style' => 'text-align: center'],
                ],
                //'ima_fkcurso',
                [
                    'class' => 'yii\grid\ActionColumn',
                    'template' => '{delete}',
                    'buttonOptions' => ['style' => 'font-size: 24px'],
                    'contentOptions' => ['style' => 'vertical-align: middle; text-align: center'],
                ],
            ]
        ]); ?>
    <?php Pjax::end(); ?>

    <div>
        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'ima_url', ['template' => "{label}\n{input}\n{hint}"])->widget(KCFinderInputWidget::className(), [
            'buttonLabel' =>'Subir imagen',
            'modalTitle' =>'Imágenes',
            'kcfOptions' => [
                'uploadURL' =>'@web/uploads/banners',
                'uploadDir' => '@app/web/uploads/banners',
            ],
        ])->label(false);?>

        <?= $form->field($model, 'ima_fkcurso', ['template' => "{label}\n{input}\n{hint}"])->hiddenInput(['value'=>$cid])->label(false); ?>
        <?= Html::submitButton('Agregar', ['class' =>'btn btn-success', 'style' => 'display: inline']) ?>
        <?= Html::a('Terminar', ['cur-curso/view', 'id' => $cid ], ['class' => 'btn btn-info']) ?>
    
        <?php ActiveForm::end(); ?>

    </div>
</div>


