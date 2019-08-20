<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CurInstructor */

$this->title = 'Update Cur Instructor: ' . $model->ins_id;
$this->params['breadcrumbs'][] = ['label' => 'Cur Instructors', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ins_id, 'url' => ['view', 'id' => $model->ins_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cur-instructor-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
