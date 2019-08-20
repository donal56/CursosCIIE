<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\CurImagenes */

$this->title = 'Create Cur Imagenes';
$this->params['breadcrumbs'][] = ['label' => 'Cur Imagenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-imagenes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
