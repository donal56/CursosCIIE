<?php

namespace iutbay\yii2kcfinder;

use Yii;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\View;
use yii\widgets\InputWidget;
use yii\bootstrap\Modal;

use iutbay\yii2fontawesome\FontAwesome;

/**
 * KCFinder Input Widget.
 * @author Kevin LEVRON <kevin.levron@gmail.com>
 */
class KCFinderInputWidget extends KCFinder
{

    /**
     * Button label
     * @var string
     */
    public $buttonLabel = 'Add Media';

    /**
     * Button options
     * @var array
     */
    public $buttonOptions = [];

    /**
     * Modal title
     * @var string
     */
    public $modalTitle = 'Media Manager';

    /**
     * Main template
     * @var array
     */
    public $template = '{button}{thumbs}';

    /**
     * Thumb template
     * @var array
     */
    public $thumbTemplate = '<input type="text" class="form-control" name="{inputName}" value="{inputValue}" readonly>';

    /**
     * Initializes the widget.
     */
    public function init()
    {
        parent::init();

        //$this->clientOptions['thumbsDir'] = $this->kcfOptions['thumbsDir'];
        $this->clientOptions['thumbsSelector'] = '#' . $this->getThumbsId();
        $this->clientOptions['thumbTemplate'] = $this->thumbTemplate;

        $this->buttonOptions['id'] = $this->getButtonId();

        Html::addCssClass($this->options, 'form-control');
        Html::addCssClass($this->buttonOptions, 'btn btn-default');
    }

    /**
     * Renders the widget.
     */
    public function run()
    {
        $this->registerClientScript();

        $button = Html::button(FontAwesome::icon('picture-o') . ' ' . $this->buttonLabel, $this->buttonOptions);
        
        if ($this->iframe) {
            $button.= Modal::widget([
                'id' => $this->getIFrameModalId(),
                'header' => Html::tag('h4', $this->modalTitle, ['class' => 'modal-title']),
                'size' => Modal::SIZE_LARGE,
                'options' => [
                    'class' => 'kcfinder-modal',
                ],
            ]);
        }

        $thumbs = '';
        if ($this->hasModel() && !empty($this->model->{$this->attribute})) {
            $image = $this->model->{$this->attribute};
            $thumbs.= strtr($this->thumbTemplate, [
                '{inputName}' => $this->getInputName(),
                '{inputValue}' => $image,
            ]);
        }
        $thumbs = Html::tag('ul', $thumbs, ['id' => $this->getThumbsId(), 'style' => 'margin-top:10px']);

        echo Html::tag('div', strtr($this->template, [
            '{button}' => $button,
            '{thumbs}' => $thumbs,
        ]), ['class' => 'kcf-input-group']);
    }

    /**
     * Registers the needed JavaScript.
     */
    public function registerClientScript()
    {
        $view = $this->getView();
        KCFinderWidgetAsset::register($view);
        $this->clientOptions['kcfUrl'] = Yii::$app->assetManager->getPublishedUrl((new KCFinderAsset)->sourcePath);

        if ($this->iframe) {
             $this->clientOptions['iframeModalId'] = $this->getIFrameModalId();
        }

        $clientOptions = Json::encode($this->clientOptions);
        $view->registerJs("jQuery('#{$this->buttonOptions['id']}').KCFinderInputWidget($clientOptions)");
    }

    public function getButtonId()
    {
        return $this->getId() . '-button';
    }

    public function getThumbsId()
    {
        return $this->getId() . '-thumbs';
    }

    public function getIFrameModalId()
    {
        return $this->getId() . '-iframe';
    }

}
