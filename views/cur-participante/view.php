<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\CurParticipante */

$this->title = $model->getNombre();
$this->params['breadcrumbs'][] = ['label' => 'Participantes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-participante-view">

    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <br>

    <p>
        <?= Html::a('', ['index'], ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Actualizar', ['update', 'id' => $model->par_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->par_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p><br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'par_id',
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
            'par_telefono',
            'par_email:email',
            'par_edad',
            'par_procedencia',
            'par_pagado',
            'par_enteraste:ntext',
            'par_observaciones:ntext',
            'par_fkcurso',
        ],
    ]) ?>

</div>
