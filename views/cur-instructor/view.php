<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\CurInstructor */

$this->title = $model->ins_fullname;
$this->params['breadcrumbs'][] = ['label' => 'Cur Instructors', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-instructor-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>

    <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->ins_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->ins_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estas seguro de eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p><br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ins_id',
            'ins_titulo',
            'ins_nombre',
            'ins_paterno',
            'ins_materno',
            'ins_descripcion:ntext',
        ],
    ]) ?>

</div>
