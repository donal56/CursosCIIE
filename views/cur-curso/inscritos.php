<?php 
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\CurCurso;

$this->title = 'Inscritos';

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
                <?php if (!Yii::$app->user->isGuest) {  ?>
                <h3>Reservados: 
                    <font size="6" style="color: #679C67;"> <?= $model->getCupoReservados(); ?></font> participantes.
                </h3>
                <?php }  ?>
                

             </div>
            <?php 
                if (Yii::$app->user->isGuest) { 
                    echo Html::a(CurCurso::getCurso()->getCupoRestante()>0 ?'Reservar':'Cupo Lleno',
                                 CurCurso::getCurso()->getCupoRestante()>0 ? '/cur-participante/reservar':'',
                    ['class' =>  CurCurso::getCurso()->getCupoRestante()>0 ?'btn btn-primary':'btn btn-danger']); 

                }else{
                    echo Html::a('Regresar','/',['class' => 'btn btn-primary']);
                }

            ?>
        </h2>
        <!-- /pager_nav -->
    
    </div>
       
</div>

<?= $this->registerCssFile("/css/cur-form.css");   ?>