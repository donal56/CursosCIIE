<?php
    use app\models\CurCurso;
    use app\models\CurImagenes;
    use app\models\CurInstructor;
    use yii\helpers\StringHelper;
    use yii\helpers\Html;

    $this->title = 'Cursos';
?>


<h1 class="display-1">Cursos</h1>
<br>

<?php if($cursos = CurCurso::getCursosProximos() || $cursos = CurCurso::getCursosActuales()) { ?>

<?php if($cursos = CurCurso::getCursosProximos()) { ?>
    <h4 class="display-4">Cursos próximos</h4><br>
    <div class="card-deck">
        <?php
            foreach ($cursos as $curso) {
        ?>
                <div class="col-sm-4">
                    <div class= "thumbnail">
                        <img src=" <?= CurImagenes::findOne(['ima_fkcurso' => $curso->cur_id])->ima_url ?> ">
                        <br>
                        <div style= "padding: 16px">
                            <p> <h4 class="display-4" style= 'display: inline'> <?= $curso->getNombre() ?> 
                                    <h5 style= 'display: inline; vertical-align: top; '><span class="label label-success">Inicia el <?= $curso->getFechaInicio() ?>!</span></h5>
                                </h4>
                                <br>
                                <small class="text-muted">
                                    Instructor:&nbsp;
                                    <?= CurInstructor::findOne(['ins_id' => $curso->cur_fkins_id])->ins_fullname ?>
                                </small>
                            </P>
                            <br>
                            <p class= 'text-justify'><?= StringHelper::truncateWords($curso->getPresentacion(), 50) ?></p>
                            <br>
                            <hr>
                            <div class="center-block" style= 'text-align: center'>
                                <?= Html::a('Conocer más', ['cur-curso/view', 'id' => $curso->cur_id], ['class' => 'btn btn-default', 'style' => 'margin: 5px']) ?>
                                <?= Html::a('Ver inscritos', ['cur-curso/inscritos', 'id' => $curso->cur_id], ['class' => 'btn btn-default', 'style' => 'margin: 5px']) ?>
                            </div>
                        </div>
                    </div>
                </div>
    <?php  }   ?>
    </div>
<?php  }   ?>

<?php if($cursos = CurCurso::getCursosActuales()) { ?>
    <h4 class="display-4">Cursos actuales</h4><br>
    <div class="card-deck">
        <?php
            foreach ($cursos as $curso) {
        ?>
                <div class="col-sm-4">
                    <div class= "thumbnail">
                        <img src=" <?= CurImagenes::findOne(['ima_fkcurso' => $curso->cur_id])->ima_url ?> ">
                        <br>
                        <div style= "padding: 16px">
                            <p> <h4 class="display-4" style= 'display: inline'> <?= $curso->getNombre() ?> 
                                    <h5 style= 'display: inline; vertical-align: top; '><span class="label label-success">Finaliza el <?= $curso->getFechaFinal() ?></span></h5>
                                </h4>
                                <br>
                                <small class="text-muted">
                                    Instructor:&nbsp;
                                    <?= CurInstructor::findOne(['ins_id' => $curso->cur_fkins_id])->ins_fullname ?>
                                </small>
                            </P>
                            <br>
                            <p class= 'text-justify'><?= StringHelper::truncateWords($curso->getPresentacion(), 50) ?></p>
                            <br>
                            <hr>
                            <div class="center-block" style= 'text-align: center'>
                                <?= Html::a('Conocer más', ['cur-curso/view', 'id' => $curso->cur_id], ['class' => 'btn btn-default', 'style' => 'margin: 5px']) ?>
                                <?= Html::a('Ver inscritos', ['cur-curso/inscritos', 'id' => $curso->cur_id], ['class' => 'btn btn-default', 'style' => 'margin: 5px']) ?>
                            </div>
                        </div>
                    </div>
                </div>
    <?php  }   ?>
    </div>
<?php  }   ?>

<?php } else {  ?>

    <div style= 'height: 15vw'>
        <h2 class= 'display-2 text-center text-muted' style= 'vertical-align: middle; margin: 0 auto;'>No hay cursos disponibles :(</h2>
    </div>

<?php   }   ?>