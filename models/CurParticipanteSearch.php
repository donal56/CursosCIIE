<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CurParticipante;

/**
 * CurParticipanteSearch represents the model behind the search form about `app\models\CurParticipante`.
 */
class CurParticipanteSearch extends CurParticipante
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['par_id', 'par_edad', 'par_fkcurso'], 'integer'],
            [['par_nombre', 'par_paterno', 'par_materno', 'par_genero', 'par_telefono', 'par_email', 'par_procedencia', 'par_observaciones', 'par_enteraste'], 'safe'],
            [['par_pagado'], 'number'],
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
    public function search($id)
    {
        $query = CurParticipante::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($id);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'par_id' => $this->par_id,
            'par_edad' => $this->par_edad,
            'par_pagado' => $this->par_pagado,
            'par_fkcurso' => $id,
        ]);

        $query->andFilterWhere(['like', 'par_nombre', $this->par_nombre])
            ->andFilterWhere(['like', 'par_paterno', $this->par_paterno])
            ->andFilterWhere(['like', 'par_materno', $this->par_materno])
            ->andFilterWhere(['like', 'par_genero', $this->par_genero])
            ->andFilterWhere(['like', 'par_telefono', $this->par_telefono])
            ->andFilterWhere(['like', 'par_email', $this->par_email])
            ->andFilterWhere(['like', 'par_procedencia', $this->par_procedencia])
            ->andFilterWhere(['like', 'par_enteraste', $this->par_enteraste])
            ->andFilterWhere(['like', 'par_observaciones', $this->par_observaciones]);

        return $dataProvider;
    }
}
