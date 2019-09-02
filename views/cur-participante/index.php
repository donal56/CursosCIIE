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
        if (CurCurso::getCurso()->getCupoRestante()>0) { 
            echo Html::a('Registrar Participante', ['create'], ['class' => 'btn btn-success']);
        }else{
            echo Html::Button('Cupo Lleno' ,['class' => 'btn btn-danger']);
        }
   
         ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'par_id',
            'par_nombre',
            'par_paterno',
            'par_materno',
            [
                'attribute' => 'par_genero',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> getGenero();
                }
            ],
            // 'par_telefono',
            // 'par_email:email',
            // 'par_edad',
            // 'par_procedencia',
            'par_pagado',
            // 'par_observaciones:ntext',
           /* [
                'attribute' => 'par_fkcurso',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> getCurso();
                }
            ],
             */
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>

<?= $this->registerCssFile("/css/cur-form.css");   ?>