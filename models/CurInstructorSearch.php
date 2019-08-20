<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CurInstructor;

/**
 * CurInstructorSearch represents the model behind the search form about `app\models\CurInstructor`.
 */
class CurInstructorSearch extends CurInstructor
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ins_id'], 'integer'],
            [['ins_titulo', 'ins_nombre', 'ins_paterno', 'ins_materno', 'ins_descripcion'], 'safe'],
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
        $query = CurInstructor::find();

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
            'ins_id' => $this->ins_id,
        ]);

        $query->andFilterWhere(['like', 'ins_titulo', $this->ins_titulo])
            ->andFilterWhere(['like', 'ins_nombre', $this->ins_nombre])
            ->andFilterWhere(['like', 'ins_paterno', $this->ins_paterno])
            ->andFilterWhere(['like', 'ins_materno', $this->ins_materno])
            ->andFilterWhere(['like', 'ins_descripcion', $this->ins_descripcion]);

        return $dataProvider;
    }
}
