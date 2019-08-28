<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\CurParticipante */

$this->title = (!Yii::$app->user->isGuest ? 'Registrar Participante' : 'Reservar Lugar');
$this->params['breadcrumbs'][] = ['label' => 'Participantes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-participante-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
