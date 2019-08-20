<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CurCurso;

/**
 * CurCursoSearch represents the model behind the search form about `app\models\CurCurso`.
 */
class CurCursoSearch extends CurCurso
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cur_id', 'cur_cupo', 'cur_duracion', 'cur_fkins_id'], 'integer'],
            [['cur_nombre', 'cur_dirigido', 'cur_fechainicio', 'cur_fechafinal', 'cur_presentacion', 'cur_objetivo', 'cur_requisitos', 'cur_requerimientos', 'cur_horario', 'cur_formaPago', 'cur_obtendra', 'cur_temario', 'cur_procedimiento', 'cur_contacto', 'cur_observaciones'], 'safe'],
            [['cur_costo'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = CurCurso::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'cur_id' => $this->cur_id,
            'cur_cupo' => $this->cur_cupo,
            'cur_fechainicio' => $this->cur_fechainicio,
            'cur_fechafinal' => $this->cur_fechafinal,
            'cur_duracion' => $this->cur_duracion,
            'cur_costo' => $this->cur_costo,
            'cur_fkins_id' => $this->cur_fkins_id,
        ]);

        $query->andFilterWhere(['like', 'cur_nombre', $this->cur_nombre])
            ->andFilterWhere(['like', 'cur_dirigido', $this->cur_dirigido])
            ->andFilterWhere(['like', 'cur_presentacion', $this->cur_presentacion])
            ->andFilterWhere(['like', 'cur_objetivo', $this->cur_objetivo])
            ->andFilterWhere(['like', 'cur_requisitos', $this->cur_requisitos])
            ->andFilterWhere(['like', 'cur_requerimientos', $this->cur_requerimientos])
            ->andFilterWhere(['like', 'cur_horario', $this->cur_horario])
            ->andFilterWhere(['like', 'cur_formaPago', $this->cur_formaPago])
            ->andFilterWhere(['like', 'cur_obtendra', $this->cur_obtendra])
            ->andFilterWhere(['like', 'cur_temario', $this->cur_temario])
            ->andFilterWhere(['like', 'cur_procedimiento', $this->cur_procedimiento])
            ->andFilterWhere(['like', 'cur_contacto', $this->cur_contacto])
            ->andFilterWhere(['like', 'cur_observaciones', $this->cur_observaciones]);

        return $dataProvider;
    }
}
