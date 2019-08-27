<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\CurParticipante */

$this->title = $model->par_id;
$this->params['breadcrumbs'][] = ['label' => 'Participantes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-participante-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->par_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->par_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

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
            'par_observaciones:ntext',
            'par_fkcurso',
        ],
    ]) ?>

</div>
