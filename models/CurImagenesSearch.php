<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CurImagenes;

/**
 * CurImagenesSearch represents the model behind the search form about `app\models\CurImagenes`.
 */
class CurImagenesSearch extends CurImagenes
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ima_id', 'ima_fkcurso'], 'integer'],
            [['ima_url'], 'safe'],
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
        $query = CurImagenes::find();

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
            'ima_id' => $this->ima_id,
            'ima_fkcurso' => $this->ima_fkcurso,
        ]);

        $query->andFilterWhere(['like', 'ima_url', $this->ima_url]);

        return $dataProvider;
    }
}
