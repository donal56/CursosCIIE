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

        <div class="wraper">

            <div class="content_avatars" style="text-align: center !important">
            	<table class= 'table table-bordered ' style="text-align: center !important;">
		            <tr>
		                <td><b>Inscritos:</b></td>
		                <td><b>Interesados:</b></td>
		                <td><b>Restantes:</b></td>
		           
		            </tr>

		            <tr>
		        
		                <td><font size="6em" style="color: #679C67;"> <?= $model->getCountInsctritos(); ?></font></td>
		                <td><font size="6em" style="color: #679C67;"> <?= $model->getCupoReservados(); ?></font></td>
		                <td><font size="6em" style="color: #679C67;"> <?= $model->getCupoRestante(); ?></font></td>
		            </tr>
	        	</table>


                <?php 
                    foreach ($model->getInscritos() as $participante) {
                        echo Html::img($participante->getImage());
                    }
                ?>

            </div>
            <br>
        </div>

        <h2 align="center">
        
            <?php 
                if (Yii::$app->user->isGuest) 
                { 
                    $hayCupo= CurCurso::findOne(['cur_id' => $_GET['id']])->getCupoRestante() > 0;
                    echo Html::a(   $hayCupo ? 'Reservar' : 'Cupo Lleno',
                                    $hayCupo ? ['/cur-participante/reservar', 'cid' => $_GET['id']] : '',
                            ['class' =>  $hayCupo ?'btn btn-primary':'btn btn-danger']); 
                }
                else
                {
                    echo Html::a('Regresar', Yii::$app->request->referrer ?: Yii::$app->homeUrl, ['class' => 'btn btn-primary']);
                }

            ?>
        </h2>
        <!-- /pager_nav -->
    
    </div>
       
</div>

<?php 
    $this->registerCssFile("/css/cur-form.css");  
    $this->registerCssFile("/css/cursos.css");
 ?>
