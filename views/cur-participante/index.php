<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\CurParticipanteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cur Participantes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-participante-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Cur Participante', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'par_id',
            'par_nombre',
            'par_paterno',
            'par_materno',
            'par_genero',
            // 'par_telefono',
            // 'par_email:email',
            // 'par_edad',
            // 'par_procedencia',
            // 'par_pagado',
            // 'par_observaciones:ntext',
            // 'par_fkcurso',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
