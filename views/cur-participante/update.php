<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CurParticipante */

$this->title = 'Update Cur Participante: ' . $model->par_id;
$this->params['breadcrumbs'][] = ['label' => 'Cur Participantes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->par_id, 'url' => ['view', 'id' => $model->par_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cur-participante-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
