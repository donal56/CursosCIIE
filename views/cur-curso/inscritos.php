<?php 
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>

<div class="wraper">
    <div class="content_block">
        <!-- top_title -->
        <div class="top_title">
            <div class="wraper">
                <h2>PARTICIPANTES</h2>
            </div>
        </div>
        <!-- /top_title -->
    </div>
   
    <div class="wraper-ins">
        <!-- pager_nav -->
        <h2 align="center">
            <div align="center">
                <h3>Inscritos:
                    <font size="6" style="color: #679C67;"> <?= $model->getCountInsctritos(); ?></font> participantes.
                </h3> 
                <br>
             </div>
        </h2>
    
        <div class="wraper">

            <div class="content_avatars">

                <?php 

                    foreach ($model->getInscritos() as $participante) {
                        echo Html::img($participante->getImage());
                    }
                ?>

            </div>
            <br>
        </div>

        <h2 align="center">
            <div align="center">
                <h3>Cupo Restante: 
                    <font size="6" style="color: #679C67;"> <?= $model->getCupoRestante(); ?></font> participantes.
                </h3> 
                <br>
             </div>
            <?= Html::a('Regresar', '/cur-curso', ['class' => 'btn btn-primary']) ?>
        </h2>
        <!-- /pager_nav -->
    
    </div>
       
</div>



<?php 
$this->registerCss('
    .wraper-ins{
        text-align: -webkit-center;
    }
    .content_avatars{
        max-width: 650px;
        text-align: left;
    }
    @media only screen and (max-width: 479px) {
        .wraper{width:95%;}
    }
');
 ?>