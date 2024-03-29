<?php
namespace app\components;

use Yii;
class Utilidades
{
    public static function minizarString($str,$longitud)
    {
       if(strlen($str)<$longitud){
           return $str;
       }else
       {
          $tmp = str_split($str, $longitud);
          return $tmp[0]."...";
       }

       return null;
    }
    public static function minizarCadena($str,$longitud)
    {
       if(strlen($str)<$longitud){
           return $str;
       }else
       {

          $tmp = substr($str, 0, $longitud);
          return $tmp."...";
       }

       return null;
    }

    public static function eliminarSignos($str)
    {
        return preg_replace('/\W+/', ' ', $str);
    }

    public static function findCodeVideo($link)
    {

        $ps1 = strpos($link, '=');
        $pret = str_split($link, $ps1+1);
        $rs = $pret[1];
        if(!is_bool(strpos($pret[1], '&')))
        {
                $ps2 = strpos($pret[1], '&');
                $tmp = str_split($pret[1], $ps2);
                $rs = $tmp[0];
        }
        return '<iframe src="http://www.youtube.com/embed/'.$rs.'" frameborder="0" width="425" height="350"></iframe>';
    }
    public static function checkStatus($valor)
    {
        switch($valor){
            case 1: $color="warning";break;
            case 2: $color="success";break;
            case 3: $color="danger";break;
            case 4: $color="info";break;
       }
        return $color;
    }

    public static function incrementar($valor,$incremento)
    {
       $valorsiguiente=$valor+$incremento;
        return $valorsiguiente;
    }

    public static function encriptar($password, $llave)
    {
        $password = serialize($password);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC), MCRYPT_DEV_URANDOM);
        $llave = pack('H*', $llave);

        $mac = hash_hmac('sha256', $password, substr(bin2hex($llave), -32));
        $passcrypt = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $llave, $password . $mac, MCRYPT_MODE_CBC, $iv);
        $codificada = base64_encode($passcrypt) . '|' . base64_encode($iv);
        return $codificada;
    }

    public static function desencriptar($cadena, $llave)
    {
        $cadena = explode('|', $cadena . '|');
        $decodificada = base64_decode($cadena[0]);
        $iv = base64_decode($cadena[1]);
        if (strlen($iv) !== mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC)) {
            return false;
        }
        $llave = pack('H*', $llave);
        $desencrypt = trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $llave, $decodificada, MCRYPT_MODE_CBC, $iv));
        $mac = substr($desencrypt, -64);
        $desencrypt = substr($desencrypt, 0, -64);
        $calcmac = hash_hmac('sha256', $desencrypt, substr(bin2hex($llave), -32));
        if ($calcmac !== $mac) {
            return false;
        }
        $desencrypt = unserialize($desencrypt);
        return $desencrypt;
    }

    public static function validarPassword($passwordEntrante, $passwordBD) {

        $passwordBD = Utilidades::desencriptar($passwordBD, Yii::$app->params['llaveHexadecimal']);

        if ($passwordEntrante == $passwordBD) {
            return true;
        } else {
            return false;
        }
    }

    public static function mEncriptar($password)
    {
        $llave = Yii::$app->params['llaveHexadecimal'];
        $password = serialize($password);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC), MCRYPT_DEV_URANDOM);
        $llave = pack('H*', $llave);

        $mac = hash_hmac('sha256', $password, substr(bin2hex($llave), -32));
        $passcrypt = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $llave, $password . $mac, MCRYPT_MODE_CBC, $iv);
        $codificada = base64_encode($passcrypt) . '|' . base64_encode($iv);
        return $codificada;
    }

    public static function cadenaAleatoria($longitud)
    {
      // estamos utilizando sólo este caracteres / números en la generación de cadena
      $caracteres ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
      $cadena =''; // definir variable con valor vacío
      // generamos un entero aleatorio en primer lugar, a continuación, nos estamos carácter correspondiente ,
      // tiene que poner el carácter a la variable $ cadena. estamos repitiendo este ciclo hasta que se alcanza
      // la longitud dada
      for($i=0;$i<$longitud; $i++)
      {
          $cadena .= $caracteres[rand(0,strlen($caracteres)-1)];
      }
      return $cadena ; // devolver la cadena final
    }

    public static function obtenerContenido($tipo)
    {
      $ruta = Yii::getAlias('@webroot')."/archivos/formato/";
      $img = '';
      if($tipo == 1)
      {
        $ruta .= 'cabecera.txt';
      }
      else if($tipo == 2)
      {
        $ruta .= 'pie_pagina.txt';
      }

      if (file_exists($ruta))
      {
          $img = file($ruta)[0];
      }
      return $img;
    }

    public static function enviarCorreo($params)
    {
      $correo = Yii::$app->mailer->compose('correos/'.$params['plantilla'], [
        //'logo' => '/plantillas/itvh/logos/logoitvhpie.png',
        'usuario' => $params['dest'],
      ]);
      $correo->setFrom('paginaitvh@itvillahermosa.edu.mx');//Correo de mesa de ayuda
      $correo->setTo($params['dest']);
      $correo->setSubject($params['asunto']);
      if($correo->send()) {
        return true;
      } else {
        return false;
      }
    }

    public static function contarDias($ini, $fin)
    {
      $ini = new \DateTime($ini);
      $fin = new \DateTime($fin);
      $fin->modify('+1 day');
      $interval = $fin->diff($ini);
      // total de dias
      $dias = $interval->days;
      // crear un periodo iterateable de la fecha ( P1D equivale a 1 día)
      $periodo = new \DatePeriod($ini, new \DateInterval('P1D'), $fin);
      // almacenado como matriz, por lo que puede añadir más de una
      $vacaciones = [];
      foreach($periodo as $dt) {
          $hoy = $dt->format('D');
          //
          if (in_array($dt->format('Y-m-d'), $vacaciones)) {
             $dias--;
          }
          // Restar si es sabado o domingo
          if ($hoy == 'Sat' || $hoy == 'Sun') {
              $dias--;
          }
      }
      return $dias;
    }

    public static function actualizarPP($id)
    {
      $hoy = date("Y-m-d");
      $sg = \app\models\Seguimiento::find()->where("fkUsuario = {$id} AND cerrado != 1")->one();
      if($sg !== null) {
        $pr = \app\models\Periodo::findOne(['estatus' => 1]);
        $total = self::contarDias($pr->fechaInicio, $pr->fechaCierre);
        $sys = self::contarDias($hoy, $pr->fechaCierre);
        $real = $total - $sys;
        //$porcent = ($real / $total) * 100;
        $sg->porcentaje = $real;
        $sg->save(false);
      }
    }

    public static function calcularHoras($t1, $t2)
    {
      list($h1, $m1) = sscanf($t1, "%d:%d");
      list($h2, $m2) = sscanf($t2, "%d:%d");

      $hrs = ($h2-$h1) + ($m2-$m1)/60;

      if ($hrs < 0) {
        $hrs = $hrs + 24;
      }

      return $hrs;
    }

    public static function validarHorario($tiempos)
    {
      if(count($tiempos) == 3) {
        list($t1, $t2, $tn) = $tiempos;
        $t1 = +str_replace(":", "", $t1);
        $t2 = +str_replace(":", "", $t2);
        $tn = +str_replace(":", "", $tn);
        if ($t2 > $t1) {//Salida mayor a entrada         
          return $t1 <= $tn && $tn < $t2;//True = Entrada es menor/igual a hora actual Y si hora actual es menor a Salida
        } else {
          return ! ($t2 <= $tn && $tn < $t1);
        }
      } else {
        return false;
      }
    }

    public static function inicializarKCFinder($ruta)
    {
      $kcfOptions = array_merge(\iutbay\yii2kcfinder\KCFinder::$kcfDefaultOptions, [
          'uploadURL' => Yii::getAlias('@web')."/$ruta",
          'uploadDir' => Yii::getAlias('@app')."/web/$ruta",
          'access' => [
              'files' => [
                  'upload' => true,
                  'delete' => true,
                  'copy' => false,
                  'move' => false,
                  'rename' => true,
              ],
              'dirs' => [
                  'create' => false,
                  'delete' => false,
                  'rename' => false,
              ],
          ]
      ]);
      return $kcfOptions;
    }

    public static function contadorVisitas($curso)
    {
      #Crear una sesión si no existe
      if(!isset($_SESSION)) 
	    { 
        session_start();
	    } 
      
      #Directorio del contador
      $nombreContador = Yii::getAlias('@webroot/counters/visitas_' . $curso . '.txt');
	  
      #Compruebe si existe un archivo de texto. Si no crear uno e inicializarlo a cero visitas y cero descargas.
      if (!file_exists($nombreContador)) 
      {
        $f = fopen($nombreContador, "w");
        fwrite($f, "0" . PHP_EOL . "0");
        fclose($f);
      }

      #Recuperando las lineas como un arreglo
      $lines = file($nombreContador);
      $dVisitas= (int)$lines[0];
      $dArchivos = $lines[1];

      #¿Se ha contado al visitante en esta sesión?
      #Si no es así, aumente el valor del contador en uno
      if(!isset($_SESSION['visitado' . $curso]))
      {
        $_SESSION['visitado' . $curso] = "true";
        $dVisitas++;
        file_put_contents($nombreContador, $dVisitas . PHP_EOL . $dArchivos);
      }
	  
      return $dVisitas;
    }

    public static function getDescargas($curso)
    {
      #Directorio del contador
      $nombreContador = Yii::getAlias('@webroot/counters/visitas_' . $curso . '.txt');

      #Recuperando las lineas como un arreglo
      $lines = file($nombreContador);
      $dArchivos = $lines[1]; 
	  
      return $dArchivos;
    }

    public static function increaseDescargas($curso)
    {
      #Directorio del contador
      $nombreContador = Yii::getAlias('@webroot/counters/visitas_' . $curso . '.txt');

      #Recuperando las lineas como un arreglo e incrementando las descargas
      $lines = file($nombreContador);
      $dVisitas= (int)$lines[0];
      $dArchivos = (int)$lines[1] + 1;

      #Guardando los datos
      file_put_contents($nombreContador, $dVisitas . PHP_EOL . $dArchivos);
    }
    
   public static function formatoFecha($f) 
   {
      setlocale(LC_ALL, "es_ES.utf8", "es_ES", "esp");
      $diasemana = strftime("%A", strtotime($f));
      $diames = strftime("%e", strtotime($f));
      $mes = strftime("%B", strtotime($f));
      $anio = strftime("%Y", strtotime($f));      
      return "{$diasemana} {$diames} de {$mes} de {$anio}";
   }

   public static function truncateString(string $cad, int $limit)
   {
      return mb_substr($cad, 0, $limit)."...";
   }
}
