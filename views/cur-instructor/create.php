<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\CurInstructor */

$this->title = 'Agregar instructor';
$this->params['breadcrumbs'][] = ['label' => 'Instructores', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-instructor-create">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
