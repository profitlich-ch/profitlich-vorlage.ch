<?php
// Grundage dieses Moduls:
// https://craftcms.stackexchange.com/a/29629/13478

namespace modules\uniqueids;

use Craft;
use yii\base\Module as BaseModule;

// Services, Variablen und Twig Extensions müssen im Modul mit use geladen werden.
// Controller aber nicht.
use modules\uniqueids\twigextensions\Extension;

use yii\base\Event;

/**
 * modulname module
 *
 * @method static Module getInstance()
 */
class Module extends BaseModule
{
    public function init(): void
    {
        // Define a custom alias named after the namespace
        Craft::setAlias('@uniqueids', __DIR__);

        // Set the controllerNamespace based on whether this is a console or web request
        if (Craft::$app->getRequest()->getIsConsoleRequest()) {
            $this->controllerNamespace = 'modules\\uniqueids\\console\\controllers';
        } else {
            $this->controllerNamespace = 'modules\\uniqueids\\controllers';
        }

        parent::init();
        
        // Register Twig extensions
        Craft::$app->getView()->registerTwigExtension(new Extension);

        // Defer most setup tasks until Craft is fully initialized
        Craft::$app->onInit(function() {
            $this->attachEventHandlers();
        });
    }

    private function attachEventHandlers(): void
    {
        // Register event handlers here ...
        // (see https://craftcms.com/docs/4.x/extend/events.html to get started)
    }
}