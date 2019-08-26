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
    <div class= 'myContainer' align= 'center'>
        <h1 |class= 'display-1' style= 'display: inline'><?= $model->cur_nombre ?></h1>

        <?php 
                if(!Yii::$app->user->isGuest) 
                {   
                    Html::a('', ['update', 'id' => $model->cur_id], ['class' => 'glyphicon glyphicon-pencil']);
                    Html::a('', ['delete', 'id' => $model->cur_id], [
                                'class' => 'glyphicon glyphicon-trash',
                                'data' =>   [
                                                'confirm' => 'Estas seguro de eliminar este curso?',
                                                'method' => 'post'
                                            ]]);
                }
        ?>
    </div>

    <div class= 'wraper' align= 'center'>
        <br>
        <div class= "myContainer">
           <h3> El Instituto Tecnológico de Villahermosa y el Centro de Incubación e Innovación Empresarial</h2>
        </div>

        <div class= 'blog_entries-1' align= 'left'>
        <br>
        <br>

            <?php try{ ?>
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
            <?php } catch(Exception $e){} ?>

                <!--<?php echo '<pre>'; 
                    print_r($model->getImagen()); 
                    echo "</pre>";
                    echo '<pre>'; 
                    print_r($model->curImagenes); 
                    echo "</pre>" ?>--!>
            
            <div class= 'myContainer' align= 'center'>
                <img src= "/img/CIIE/cursojavaee.png" style= 'width: 100%'>
            </div>

            <?php echo Carousel::widget([
                'items' => [
                    [
                        'content' => '<img src="'. $model->getImagen() . '"/>',
                        'caption' => '<h4>This is title</h4><p>This is the caption text</p>',
                        'options' => [],
                    ],
                ]
            ]); ?>

            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Presentación del curso') ?>
                <p align= 'justify'><?php echo $model->getPresentacion(); ?></p>
            </div>
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Objetivo general del curso') ?>
                <p align= 'justify'><?php echo $model->getObjetivo(); ?></p>
            </div>
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
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
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
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
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Duración') ?>
                <p align= 'justify'>Horas: <?php echo $model->cur_duracion; ?></p>
                <p align= 'justify'><?php echo $model->getHorario(); ?></p>
            </div>
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Costo total') ?>
                <p align= 'justify'>Horas: <?php echo $model->getCosto(); ?></p>
            </div>
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
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
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
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
            <?php } catch(Exception $e){} ?>

            
            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Instructor') ?>
                <p align= 'justify'> <?php echo $model->getInstructor(); ?> </p><br>
                <p align= 'justify'> <?php echo $model->getDescripcionInstructor(); ?> </p>
            </div>
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Procedimiento de inscripción') ?>
                <ul class= 'lista'>    
                <?php 

                    foreach( $model->getProcedimiento() as $elem)
                    {
                        echo "<li class= 'lista'>" . $elem . "</li>";
                    }
                ?>
                </ul>
            </div>
            <?php } catch(Exception $e){} ?>

            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Temario') ?>
                <?php echo $model->getTemario(); ?>
            </div>
            <?php } catch(Exception $e){} ?>


            <?php try{ ?>
            <div class= 'myContainer'>
                <?= Html::tag('h4', 'Mayores Informes en:') ?>
                <p align= 'justify'><?php echo $model->getContacto(); ?></p>
            </div>
            <?php } catch(Exception $e){} ?>
        </div>
    </div>
</div>

<?php

$this->registerCss( 
    "@font-face 
    {
        font-family: 'SoberanaSans-Regular';
        src: url('/web/fonts/SoberanaSans-Regular.otf') format('opentype');
        font-weight: normal;
        font-weight: normal;
    }

    html
    {
        font-family: SoberanaSans-Regular;
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
        content: '» ';
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
    }");
?>
