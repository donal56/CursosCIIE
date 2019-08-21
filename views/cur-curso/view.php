<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\CurCurso */

$this->title = $model->cur_id;
$this->params['breadcrumbs'][] = ['label' => 'Cursos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-curso-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->cur_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->cur_id], [
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
            'cur_id',
            'cur_nombre',
            'cur_dirigido',
            'cur_cupo',
            'cur_fechainicio',
            'cur_fechafinal',
            'cur_presentacion:ntext',
            'cur_objetivo:ntext',
            'cur_requisitos',
            'cur_requerimientos',
            'cur_duracion',
            'cur_horario:ntext',
            'cur_costo',
            'cur_formaPago:ntext',
            'cur_obtendra',
            'cur_fkins_id',
            'cur_temario',
            'cur_procedimiento:ntext',
            'cur_contacto:ntext',
            'cur_observaciones:ntext',
        ],
    ]) ?>

</div>
