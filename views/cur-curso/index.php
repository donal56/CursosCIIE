<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\CurCursoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cursos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-curso-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Nuevo Curso', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cur_id',
            'cur_nombre',
            'cur_dirigido',
            'cur_cupo',
            'cur_fechainicio',
            // 'cur_fechafinal',
            // 'cur_presentacion:ntext',
            // 'cur_objetivo:ntext',
            // 'cur_requisitos',
            // 'cur_requerimientos',
            // 'cur_duracion',
            // 'cur_horario:ntext',
            // 'cur_costo',
            // 'cur_formaPago:ntext',
            // 'cur_obtendra',
            // 'cur_fkins_id',
            // 'cur_temario',
            // 'cur_procedimiento:ntext',
            // 'cur_contacto:ntext',
            // 'cur_observaciones:ntext',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
