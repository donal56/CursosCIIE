<?php

 $model->getCupoRestante();
 foreach ($model->getInscritos() as $participante) {
 	echo '<img src="'.$participante->getImage().'">';
 }
 
?>
