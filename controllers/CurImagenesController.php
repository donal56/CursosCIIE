<?php

namespace app\controllers;

use Yii;
use app\models\CurImagenes;
use app\models\CurImagenesSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CurImagenesController implements the CRUD actions for CurImagenes model.
 */
class CurImagenesController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return 
        [
             'access' => 
            [
                'class' => \yii\filters\AccessControl::className(),
                'only' => ['index','create','update','view'],
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
     * Lists all CurImagenes models.
     * @return mixed
     */
    public function actionIndex($cid)
    {
        $searchModel = new CurImagenesSearch();
        $dataProvider = $searchModel->search($cid);
        $model = new CurImagenes();

        if ($model->load(Yii::$app->request->post()) &&  $model->save())
        {
            //Para que el modelo no se recargue en caso de refrescarse
            $model = new CurImagenes(); 
            $this->refresh();
        }
        else 
        {
            return $this->render('index', 
            [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
                'cid' => $cid,
                'model' => $model
            ]);
        }

        
    }

    /**
     * Displays a single CurImagenes model.
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
     * Creates a new CurImagenes model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($cid)
    {
        $model = new CurImagenes();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return Yii::$app->request->referrer ?: Yii::$app->homeUrl;
        } else {
            return $this->render('create', [
                'model' => $model,
                'cid' => $cid
            ]);
        }
    }

    /**
     * Updates an existing CurImagenes model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->ima_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing CurImagenes model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
    }

    /**
     * Finds the CurImagenes model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CurImagenes the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CurImagenes::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
