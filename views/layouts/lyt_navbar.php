<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
use app\models\CurCurso;
?>

<?php
$links = [
  ['label' => 'Depto. Infraestructura', 'url' => ['/ticket/index', 'ads' => 68]],
  ['label' => 'Depto. Mantenimiento', 'url' => ['/ticket/index', 'ads' => 70]],
  ['label' => 'Depto. Centro de Cómputo', 'url' => ['/ticket/index', 'ads' => 26]],
];
NavBar::begin([
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar navbar-default tecnm-navbar',
    ],
]);

$menuAdmin= [
  ['label' =>  'Cursos', 'url' => ['/cur-curso/index']],
  ['label' =>  'Instructores', 'url' => ['/cur-instructor/index']],
];


$menuItems = [
    ['label' => '<span class="glyphicon glyphicon-home"></span>', 'url' => ['/']],
];

  if (Yii::$app->user->isGuest) {
//     $menuItems[] = ['label' => 'Ver Inscritos', 'url' => ['/cur-curso/inscritos']];
      //oculta reservar si el cupo esta lleno
//   if (CurCurso::getCurso()->getCupoRestante()>0) { 
//     $menuItems[] = ['label' => 'Reservar Lugar', 'url' => ['/cur-participante/reservar']];
//   }
  $menuItems[] = ['label' => 'Iniciar Sesión', 'url' => ['/user-management/auth/login']];

 } else {
  
  //Agregar opciones de administrador
    // $menuItems[] = ['label' => 'Ver Inscritos', 'url' => ['/cur-curso/inscritos']];
    // $menuItems[] = ['label' => 'Gestionar Participantes', 'url' => ['/cur-participante/index']];
  //endif;

  if (Yii::$app->user->identity->hasRole('administrador'))
  {
    $menuItems[] = ['label' => 'Administrador', 'items'=>UserManagementModule::menuItems()];
    $menuItems[] = ['label' => 'Administrar cursos', 'items'=>$menuAdmin];
  }else
  {
    $menuItems[] = ['label' => 'Administrar cursos', 'items'=>$menuAdmin];
  }

  $menuItems[] = [
  'label' => 'Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
  'url' => ['/user-management/auth/logout'],
  'linkOptions' => ['data-method' => 'post'],
  ];
}
echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-left'],
    'encodeLabels' => false,
    'items' => $menuItems,
]);
NavBar::end();
?>
