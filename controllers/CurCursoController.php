<?php

namespace app\controllers;

use Yii;
use app\models\CurCurso;
use app\models\CurImagenes;
use app\models\CurCursoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use uii\filters\AccessControl;
use app\components\Utilidades;

/**
 * CurCursoController implements the CRUD actions for CurCurso model.
 */
class CurCursoController extends Controller
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
     * Lists all CurCurso models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CurCursoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CurCurso model.
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
     * Creates a new CurCurso model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CurCurso();

        if ($model->load(Yii::$app->request->post()) && $model->preGuardar() && $model->save()) 
        {
            return $this->redirect(['cur-imagenes/index', 'cid' => $model->cur_id]);
        }
        else 
        {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing CurCurso model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())  && $model->preGuardar()  && $model->save()) 
        {
            return $this->redirect(['cur-imagenes/index', 'cid' => $model->cur_id]);
        }
        else 
        {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing CurCurso model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionInscritos($id)
    {
        return $this->render('inscritos', [
               'model' =>  $this->findModel($id),
        ]);
    }

    public function actionDescargar($id)
    {
        #Action de descargar archivo, incrementa el contador
        $url= CurCurso::findOne($id)->getURLArchivo();
        Utilidades::increaseDescargas($id);

        return $this->redirect($url);
    }
    
    /**
     * Finds the CurCurso model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CurCurso the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CurCurso::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionMain()
    {
        return $this->render('main');
    }
}
