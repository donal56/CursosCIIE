<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;
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
        <!-- <?= Html::a('Registrar Instructor', ['create'], ['class' => 'btn btn-success']) ?> -->
    </p>

    <?= Html::a('Crear Instructor', '#', [
            'id' => 'activity-index-link',
            'class' => 'btn btn-success',
            'data-toggle' => 'modal',
            'data-target' => '#modal',
            'data-url' => Url::to(['create']),
            'data-pjax' => '0',
        ]); ?>

    <?php
    $this->registerJs(
        "$(document).on('click', '#activity-index-link', (function() {
            $.get(
                $(this).data('url'),
                function (data) {
                    $('.modal-body').html(data);
                    $('#modal').modal();
                }
            );
        }));"
    ); ?>
 
    <?php
    Modal::begin([
        'id' => 'modal',
        'header' => '<h4 class="modal-title">Complete</h4>',
        'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Cerrar</a>',
    ]);
 
echo "<div class='well'></div>";
 
Modal::end();
?>

<?php Pjax::begin(); ?> 
 <?= GridView::widget([
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
