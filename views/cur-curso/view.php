<?php

    use yii\helpers\Html;
    use yii\helpers\JSON;
    use yii\bootstrap\Carousel;
    use yii\base;

    /* @var $this yii\web\View */
    /* @var $model app\models\CurCurso */

    $this->title = $model -> cur_nombre;
?>

<div class="cur-curso-view main-body">

    <br>
    <div class="content_block">
 <!-- top_title -->
    <div class="top_title"><div class="text_bar_shadow"></div>
    <div class="wraper" align= 'center'>
    <h2><?= $model->cur_nombre ?></h2>
        <?php if(!Yii::$app->user->isGuest) { ?>
                <?= Html::a('', ['update', 'id' => $model->cur_id], ['class' => 'glyphicon glyphicon-pencil glyph-top-bar']); ?>
                <?= Html::a('', ['delete', 'id' => $model->cur_id], [
                            'class' => 'glyphicon glyphicon-trash glyph-top-bar',
                            'data' =>   [
                                            'confirm' => 'Estas seguro de eliminar este curso?',
                                            'method' => 'post'
                                        ]]); } ?>
   
    </div>
    <div class="text_bar_shadow2"></div></div>
    </div>

  
    <div class= 'wraper' align= 'center'>
        <br>
        <div class= "myContainer">
           <h3> El Instituto Tecnológico de Villahermosa y el Centro de Incubación e Innovación Empresarial</h2>
        </div>

        <div class= 'blog_entries-1' align= 'left'>
        <br>
        <br>

            <?php if($model->getDirigido()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Invitan a') ?>
                    <ul class= 'lista'>    
                    <?php 
                        foreach($model->getDirigido() as $elem)
                        {
                            echo "<li class= 'lista'>" . $elem . "</li>";
                        }
                    ?>
                    </ul>
                </div>
            <?php } ?>
            
            <?php if($model->getImagenes()) { ?>
                <div class= 'myContainer2' align= 'center'>                
                    <?php 
                        $images= $model->getImagenes();
                        $arr = array();
                        
                        foreach($images as $image)
                        {
                           $arr[] = "<img src= '" . $image . "'/>";
                        }
                        echo Carousel::widget(['showIndicators' => true, 'items' => $arr]);
                    ?>    
                </div>
            <?php } ?>


            <?php if($model->getPresentacion()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Presentación del curso') ?>
                    <p align= 'justify'><?php echo $model->getPresentacion(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getObjetivo()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Objetivo general del curso') ?>
                    <p align= 'justify'><?php echo $model->getObjetivo(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getRequisitos()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Requisitos del aspirante') ?>
                    <ul class= 'lista'>    
                    <?php 
                        foreach($model->getRequisitos() as $elem)
                        {
                            echo "<li class= 'lista'>" . $elem . "</li>";
                        }
                    ?>
                    </ul>
                </div>
            <?php } ?>


            <?php if($model->getRequerimientos()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Requerimientos') ?>
                    <ul class= 'lista'>    
                    <?php 
                        foreach($model->getRequerimientos() as $elem)
                        {
                            echo "<li class= 'lista'>" . $elem . "</li>";
                        }
                    ?>
                    </ul>
                </div>
            <?php } ?>


            <?php if($model->getDuracion() && $model->getHorario()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Duración') ?>
                    <p align= 'justify'>Horas: <?php echo $model->getDuracion(); ?></p>
                    <p align= 'justify'><?php echo $model->getHorario(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getCosto()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Costo total') ?>
                    <p align= 'justify'>Horas: <?php echo $model->getCosto(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getFormaPago()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Formas de pago') ?>
                    <ul class= 'lista'>    
                    <?php 
                        foreach($model->getFormaPago() as $elem)
                        {
                            echo "<li class= 'lista'>" . $elem . "</li>";
                        }
                    ?>
                    </ul>
                </div>
            <?php } ?>


            <?php if($model->getObtendra()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Que obtendrá el participante') ?>
                    <ul class= 'lista'>    
                    <?php 
                        foreach($model->getObtendra() as $elem)
                        {
                            echo "<li class= 'lista'>" . $elem . "</li>";
                        }
                    ?>
                    </ul>
                </div>
            <?php } ?>

            
            <?php if($model->getInstructor() && $model->getDescripcionInstructor()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Instructor') ?>
                    <p align= 'justify'> <?php echo $model->getInstructor(); ?> </p><br>
                    <p align= 'justify'> <?php echo $model->getDescripcionInstructor(); ?> </p>
                </div>
            <?php }  ?>


            <?php if($model->getProcedimiento()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Procedimiento de inscripción') ?>
                    <ul class= 'lista'>    
                    <?php 

                        foreach( $model->getProcedimiento() as $elem)
                        {
                            echo "<li class= 'lista'>" . $elem . "</span></li>";
                        }
                    ?>
                    </ul>
                </div>
            <?php } ?>

            <?php if($model->getTemario()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Temario') ?>
                    <br>
                    <?php echo $model->getTemario(); ?>
                </div>
            <?php } ?>


            <?php if($model->getContacto()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Mayores Informes en:') ?>
                    <p align= 'justify'><?php echo $model->getContacto(); ?></p>
                </div>
            <?php } ?>
        </div>
    </div>
</div>

<?php

$this->registerCss( 
    "@font-face 
    {
        font-family: SoberanaSans-Regular;
        src: url('/fonts/SoberanaSans-Regular.otf') format('opentype');
        font-weight: normal;
        font-weight: normal;
    }

    html
    {
        font-family: SoberanaSans-Regular;
        font: bold 4vmin 'SoberanaSans';
    }

    h1, h2, h3, h4, h5, h6 
    {
        margin: 10px 0;
        font-family: inherit;
        font-weight: bold;
        line-height: 20px;
        color: inherit;
        text-rendering: optimizelegibility;
        line-height: 40px;
    }

    li.lista::before, .myContainer li::before
    {
        font-weight: bold;
        content: url('/img/CIIE/bullet.png');
        padding-right: 0.8em;
        position: relative;
        top: 20px;
        display: table;
        right: 25px;
    }    
    
    ul.lista, li.lista, .myContainer li, .myContainer ul
    {
        padding: 7px 0 7px 7px;
    }
    
    .myContainer
    {
        padding-bottom: 2em;
        width: 80%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
    }
    .myContainer2
    {
        padding-bottom: 2em;
        width: 80%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
    }
    
    .myContainer p
    {
        line-height: 1.3em;
    }
    
    .top_title h2
    {
        font: bold 4vmin 'SoberanaSans';
    }
    
    .glyph-top-bar
    {
        color: #ffffff;
        font-size: 20px;
        margin: 10px 0;
        line-height: 40px;
    }");
?>
