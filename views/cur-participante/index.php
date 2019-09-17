<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use app\models\CurCurso;
/* @var $this yii\web\View */
/* @var $searchModel app\models\CurParticipanteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Participantes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-participante-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php
        if (CurCurso::findOne(['cur_id' => $_GET['cid']])->getCupoRestante()>0) { 
            echo Html::a('Registrar Participante', ['create', 'cid' => $_GET['cid']], ['class' => 'btn btn-success']);
        }else{
            echo Html::Button('Cupo Lleno' ,['class' => 'btn btn-danger']);
        }
   
         ?>
    </p>
    <br>
    
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => 
        [
            ['class' => 'yii\grid\SerialColumn'],

            //'par_id',
            'par_nombre',
            'par_paterno',
            'par_materno',
            [
                'attribute' => 'par_genero',
                'format'    => 'raw',
                'value'     => function ($model) 
                {
                    return $model-> getGenero();
                }
            ],
            // 'par_telefono',
            // 'par_email:email',
            // 'par_edad',
            // 'par_procedencia',
            [
                'attribute' => 'par_pagado',
                'format' => 'raw',
                'value' => function($model)
                {
                    return $model -> getPagado();
                }
            ],
            // 'par_observaciones:ntext',
           /* [
                'attribute' => 'par_fkcurso',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> getCurso();
                }
            ],
             */
            [
                'class' => 'yii\grid\ActionColumn',
                // 'urlCreator'    =>  function ($action, $model, $key, $index, $t) 
                // {
                //     return ($action == 'delete') ?: '/cur-participante/delete?id=' . $key . '&cid=' . $_GET['cid'];
                // }
            ]
        ]
    ]); ?>
<?php Pjax::end(); ?></div>

<?= $this->registerCssFile("/css/cur-form.css");   ?>