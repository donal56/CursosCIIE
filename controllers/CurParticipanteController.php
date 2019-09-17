<?php

namespace app\controllers;

use Yii;
use app\models\CurParticipante;
use app\models\CurParticipanteSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\CurCurso;

/**
 * CurParticipanteController implements the CRUD actions for CurParticipante model.
 */

class CurParticipanteController extends Controller
{
    /**
     * @inheritdoc
     */
    
    public function behaviors()
    {
        return [
            'access' => 
            [
                'class' => \yii\filters\AccessControl::className(),
                'only' => ['index','create','update','reservar'],
                'rules' => 
                [
                    // allow authenticated users
                    [
                        'actions' =>  ['index','update'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                     //si el cupo esta lleno se inhabilita acceder a la accion create y reservar
                    [
                        'actions' =>  ['create'],
                        'allow' => (CurCurso::findOne(['cur_id' => 
                            isset($_GET['cid'])? $_GET['cid'] :  
                            CurParticipante::findOne([
                                'par_id' => Yii::$app->request->get('id')])->par_fkcurso
                            ])->getCupoRestante()>0),
                        'roles' => ['@'],
                    ],
                    [
                       
                        'actions' =>  ['reservar'],
                        'allow' => (CurCurso::findOne(['cur_id' => 
                            isset($_GET['cid'])? $_GET['cid'] :  
                            CurParticipante::findOne([
                                'par_id' => Yii::$app->request->get('id')])->par_fkcurso 
                            ])->getCupoRestante()>0),
                    ],
                    // everything else is denied
                ],
            ],
        ];
    }
/*
(CurCurso::findOne(['cur_id' => CurParticipante::findOne(['par_id' => Yii::$app->request->get('id')])->par_fkcurso])->getCupoRestante()>0),
*/

    /**
     * Lists all CurParticipante models.
     * @return mixed
     */
    public function actionIndex($cid)
    {

        $searchModel = new CurParticipanteSearch();
        $dataProvider = $searchModel->search($id);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'cid' => $cid
        ]);
    }

    /**
     * Displays a single CurParticipante model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id)
        ]);
    }

    /**
     * Creates a new CurParticipante model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($cid)
    {
        $model = new CurParticipante();
        //si se va a reservar
        if (Yii::$app->user->isGuest) {
            $model->setScenario('unlogged');
        }
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
                if (Yii::$app->user->isGuest) {
                    return $this->render('reserva');
                }
                
                return $this->redirect(['index', 'cid' => $_GET['cid'],]);
            
        } else {
            return $this->render('create', [
                'model' => $model,
                'cid' => $cid
            ]);
        }
    }

    public function actionReservar()
    {
        return $this->actionCreate();
    }


    /**
     * Updates an existing CurParticipante model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->par_id]);
        } else {
            return $this->render('update', [
                'model' => $model,

            ]);
        }
    }

    /**
     * Deletes an existing CurParticipante model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect( Yii::$app->request->referrer ?: Yii::$app->homeUrl);
    }

    /**
     * Finds the CurParticipante model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CurParticipante the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CurParticipante::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('La página requerida no existe.');
        }
    }
}
