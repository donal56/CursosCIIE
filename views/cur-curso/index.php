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
    <br>
    <p>
        <?= Html::a('Nuevo Curso', ['create', 'id' => $id], ['class' => 'btn btn-success']) ?>
    </p>
    <br>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel'  => $searchModel ,
        'columns'      => [
            ['class' => 'yii\grid\SerialColumn'],

            //'cur_id'  ,
            'cur_nombre',
            //'cur_dirigido',
            [
                'attribute' => 'cur_cupo',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> getCupo();
                }
            ],
            'cur_fechainicio'          ,
            // 'cur_fechafinal'        ,
            // 'cur_presentacion:ntext',
            // 'cur_objetivo:ntext'    ,
            // 'cur_requisitos'        ,
            // 'cur_requerimientos'    ,
            [
                'attribute' => 'cur_duracion',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> getDuracion();
                }
            ],
            // 'cur_horario:ntext',
             [
                'attribute' => 'cur_costo',
                'value'     => function ($model) {
                    return $model-> getCosto();
                }
            ],
            // 'cur_formaPago:ntext',
            // 'cur_obtendra',
            [
                'attribute' => 'cur_fkins_id',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> getInstructor();
                }
            ],
            [
                'label' => 'Banners',
                'format' => 'raw',
                'value' => function($model) {return Html::a('Agregar <br> Banners',['cur-imagenes/index', 'cid' => $model->cur_id], ['class' => 'btn btn-success btn-xs', 'data-pjax' => 0]);}
            ],
            // 'cur_temario',
            // 'cur_procedimiento:ntext',
            // 'cur_contacto:ntext',
            // 'cur_observaciones:ntext',

            [
                'class' => 'yii\grid\ActionColumn',
                'buttons' => [
                    'participantes' => function ($url, $model, $key) {
                        return Html::a ( '<span class="glyphicon glyphicon-user"></span> ', ['cur-participante/index', 'cid' => $model->cur_id],['data-pjax'=>"0"]);

                    },

                ],
                'template' => '{view} {update} {participantes} {delete}'
            ]
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
