<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CurCurso */

$this->title = 'Actualizar Curso';
$this->params['breadcrumbs'][] = ['label' => 'Cursos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cur_id, 'url' => ['view', 'id' => $model->cur_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cur-curso-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelimg' => $modelimg,
    ]) ?>

</div>


<?= $this->registerCssFile("/css/cur-form.css");   ?>