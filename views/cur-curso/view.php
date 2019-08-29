<?php

    use yii\helpers\Html;
    use yii\helpers\JSON;
    use yii\bootstrap\Carousel;
    use yii\base;
    use app\components\Utilidades;
    use yii\helpers\Url;

    /* @var $this yii\web\View */
    /* @var $model app\models\CurCurso */

    $this->title = $model -> getNombre();
?>

<div class="cur-curso-view main-body">

    <br>
    <div class="content_block">
 <!-- top_title -->
    <div class="top_title"><div class="text_bar_shadow"></div>
    <div class="wraper" align= 'center'>
    <h1 class= 'encabezado'><font color= "white"><?= $model->getNombre()?></font></h1>
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
        <div class= "myContainer gray">
           <h2 class= 'encabezado'> El Instituto Tecnológico de Villahermosa y el Centro de Incubación e Innovación Empresarial</h2>
           <h4 class= 'encabezado'>Esta página ha sido visitada <font style="color: #679C67;" size="5"><?= Utilidades::contadorVisitas($model->cur_id) ?></font> veces.</h4>
        </div>

        <div class= 'blog_entries-1 gray' align= 'left'>
        <br>
        <br>

            <?php if($model->getDirigido()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Invitan a', ['class' => 'encabezado']) ?>
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
                    <?= Html::tag('h4', 'Presentación del curso', ['class' => 'encabezado']) ?>
                    <p align= 'justify'><?php echo $model->getPresentacion(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getObjetivo()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Objetivo general del curso', ['class' => 'encabezado']) ?>
                    <p align= 'justify'><?php echo $model->getObjetivo(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getRequisitos()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Requisitos del aspirante', ['class' => 'encabezado']) ?>
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
                    <?= Html::tag('h4', 'Requerimientos', ['class' => 'encabezado']) ?>
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
                    <?= Html::tag('h4', 'Duración', ['class' => 'encabezado']) ?>
                    <p align= 'justify'>Horas: <?php echo $model->getDuracion(); ?></p>
                    <p align= 'justify'><?php echo $model->getHorario(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getCosto()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Costo total', ['class' => 'encabezado']) ?>
                    <p align= 'justify'>Horas: <?php echo $model->getCosto(); ?></p>
                </div>
            <?php } ?>


            <?php if($model->getFormaPago()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Formas de pago', ['class' => 'encabezado']) ?>
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
                    <?= Html::tag('h4', 'Que obtendrá el participante', ['class' => 'encabezado']) ?>
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
                    <?= Html::tag('h4', 'Instructor', ['class' => 'encabezado']) ?>
                    <p align= 'justify'> <?php echo $model->getInstructor(); ?> </p><br>
                    <p align= 'justify'> <?php echo $model->getDescripcionInstructor(); ?> </p>
                </div>
            <?php }  ?>


            <?php if($model->getProcedimiento()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Procedimiento de inscripción', ['class' => 'encabezado']) ?>
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
                    <?= Html::tag('h4', 'Temario', ['class' => 'encabezado']) ?>
                    <br>
                    <?php echo $model->getTemario(); ?>
                </div>
            <?php } ?>


            <?php if($model->getContacto()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Mayores Informes en:', ['class' => 'encabezado']) ?>
                    <p align= 'justify'><?php echo $model->getContacto(); ?></p>
                </div>
            <?php } ?>

            <div class= 'myContainer'>
                <div class="share_story">
                    <span class= 'share_bg'></span>
                    <h4 class= 'encabezado' style= 'top: -30px; line-height: 30px;'>¡Comparte este Curso!</h4>
                    <script type="text/javascript">
                        var dir = window.document.URL;
                        var dir2 = encodeURIComponent(dir);
                        var tit = window.document.title;
                        var tit2 = encodeURIComponent(tit);
                        var texto = encodeURIComponent("Te comparto este increible curso\n");
                    </script>
                    <ul>          
                        <!-- Facebook sharer ya no acepta parametros mas que ?u= desde 2016~ !-->
                        <li><a class="facebook" href="javascript: void(0);" onclick="window.open('http://www.facebook.com/sharer.php?u=' + dir2 + '', tit,'toolbar=0, status=0, width=700, height=480');"></a>
                        </li>
                        <li><a class="tweeter" href="javascript: void(0);" onclick="window.open('http://twitter.com/?status=' + texto + dir2 + '%20vía @itvh', 'ventanacompartir', 'toolbar=0, status=0, width=650, height=450');"></a>
                        </li>
                        <li> <a  class="whatsapp" onclick="window.open('whatsapp://send?text=' + texto + dir2, 'ventanacompartir', 'toolbar=0, status=0, width=650, height=450');" data-action="share/whatsapp/share"><img border="0" width="64px" height="64px"></a></li>
                    </ul>
                </div> 
            </div>

            <?php if($model->getURLArchivo()) { ?>
                <div class= 'myContainer'>
                    <?= Html::tag('h4', 'Archivos adjuntos', ['class' => 'encabezado']); ?>
 
                    <table class="table table-hover" cellspacing=10 cellmargin=0 border=0 width="85%">
                        <tr>
                            <td width='5%' valign='top'><img src='/img/iconpdf.gif'></td>
                            <td width='5%' valign='top'></td>
                            <td width='60%'><?php echo $model->getNombre(); ?></td>
                            <td valign='top'><?php echo Html::a('Descargar', $model->getURLArchivo(), ['class'=>'btn-success btn_col btn_green','type'=>'button']);?></td>
                            <td width='20%' valign='top'><?php echo '1'; ?> descargas</td>
                        </tr>
                    </table>
                <div>
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
    }

    html
    {
        font-family: SoberanaSans-Regular;
        font: bold 4vmin 'SoberanaSans';
    }

    .encabezado
    {
        margin: 10px 0;
        font-family: inherit;
        font-weight: bold;
        line-height: 20px;
        text-rendering: optimizelegibility;
        line-height: 40px;
        color: #626363 !important;
    }

    li.lista::before, .myContainer li::before
    {
        font-weight: bold;
        content: url('/img/bullet.png');
        padding-right: 0.8em;
        position: relative;
        top: 20px;
        display: table;
        right: 25px;
    }    
    
    ul.lista, li.lista, .myContainer li, .myContainer ul
    {
        padding: 4px 20px 4px 20px;
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
    }
    
    .gray
    {
        color: #626363 !important;
    }

    .share_story ul li a.whatsapp 
    {
        background-position: -337px 1px;
    }
    
    .share_story span.share_bg
    {
        position: absolute;
        top: 0px;
        left: 0;
        width: 300px;
        height: 89px;
        padding: 0px;
        background: url('/img/share_bg.png') no-repeat;
    }
    
    .share_story ul li
    {
        padding-right: 5em;   
    }
    
    .share_story ul 
    {
        left: 21em;
        top: 0px;
    }");
?>
