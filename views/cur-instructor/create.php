<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\CurInstructor */

$this->title = 'Create Cur Instructor';
$this->params['breadcrumbs'][] = ['label' => 'Cur Instructors', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-instructor-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
