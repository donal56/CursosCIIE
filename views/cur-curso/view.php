<?php

    use yii\helpers\Html;
    use yii\widgets\DetailView;

    /* @var $this yii\web\View */
    /* @var $model app\models\CurCurso */

    $this->title = $model -> cur_nombre;
?>

<div class="cur-curso-view main-body">

    <br>
    <div class= 'container'>
        <h1 |class= 'display-1' style= 'display: inline' ><?= $model->cur_nombre ?></h1>

        <?= Html::a('', ['update', 'id' => $model->cur_id], ['class' => 'glyphicon glyphicon-pencil']) ?>
        <?= Html::a('', ['delete', 'id' => $model->cur_id], [
                'class' => 'glyphicon glyphicon-trash',
                'data' => [
                    'confirm' => 'Are you sure you want to delete this item?',
                    'method' => 'post',
                ],
            ]) 
        ?>
    </div>

    <div class= 'wraper'>
        <div class= 'blog_entries'>
            <h2 align= 'center'> El Instituto Tecnológico de Villahermosa y el Centro de Incubación e Innovación Empresarial</h2>

            <h4> Invitan a </h4>
            <li></li>

            


        </div>
    </div>
</div>
