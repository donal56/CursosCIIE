<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CurCurso */

$this->title = 'Crear Curso';
$this->params['breadcrumbs'][] = ['label' => 'Cursos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-curso-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
