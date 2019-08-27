<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\CurInstructorSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Instructores';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cur-instructor-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Registrar Instructor', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'ins_id'       ,
            'ins_titulo'     ,
            'ins_nombre'     ,
            'ins_paterno'    ,
            'ins_materno'    ,
            'ins_descripcion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
