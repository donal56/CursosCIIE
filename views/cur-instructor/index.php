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

    <h1><?= Html::encode($this->title) ?></h1><br>
    <?php //echo $this->render('_search', ['model' => $searchModel]); ?>
    <!-- <?= Html::a('Registrar instructor', ['createAjax'], ['class' => 'btn btn-success']) ?><br> -->
    <br>

<?php Pjax::begin(); ?> 
 <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'ins_fullname',
                'label' => 'Instructor'
            ],
            'ins_descripcion:ntext',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
