<?php

use craft\helpers\App;

// Use the current host for dev server requests. Otherwise fall back to the primary site.
$host = Craft::$app->getRequest()->getIsConsoleRequest()
    ? App::env('PRIMARY_SITE_URL')
    : Craft::$app->getRequest()->getHostInfo();

return [
    'checkDevServer' => true,
    'devServerInternal' => 'http://localhost:3000',
    'devServerPublic' => App::env('PRIMARY_SITE_URL') . ':3000',
    'serverPublic' => App::env('PRIMARY_SITE_URL') . '/dist/',
    'useDevServer' => App::env('CRAFT_ENVIRONMENT') === 'dev',
    'manifestPath' => '@webroot/dist/.vite/manifest.json',
    'includeScriptOnloadHandler' => true,
    'errorEntry' => 'src/js/app.ts',
];