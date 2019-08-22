<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CurImagenes */

$this->title = 'Actualizar Imagenes: ' . $model->ima_id;
$this->params['breadcrumbs'][] = ['label' => 'Imagenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ima_id, 'url' => ['view', 'id' => $model->ima_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cur-imagenes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
