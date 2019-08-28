<?php

namespace app\controllers;

use Yii;
use app\models\CurParticipante;
use app\models\CurParticipanteSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

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
                'only' => ['index','create','update'],
                'rules' => 
                [
                    // allow authenticated users
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    // everything else is denied
                ],
            ],
        ];
    }

    /**
     * Lists all CurParticipante models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CurParticipanteSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
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
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new CurParticipante model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
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
                
                return $this->redirect(['view', 'id' => $model->par_id]);
            
        } else {
            return $this->render('create', [
                'model' => $model,
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

        return $this->redirect(['index']);
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
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
