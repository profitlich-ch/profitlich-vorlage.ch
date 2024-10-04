<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\config\GeneralConfig;
use craft\helpers\App;

// Jede Umgebung isXxx wird true oder false
// Abfrage mit ->allowAdminChanges($isXxx) oder invers ->allowAdminChanges(!$isDev)
$isDev = App::env('CRAFT_ENVIRONMENT') === 'dev';
$isStaging = App::env('CRAFT_ENVIRONMENT') === 'staging';
$isProduction = App::env('CRAFT_ENVIRONMENT') === 'production';

// https://nystudio107.com/blog/fluent-multi-environment-config-for-craft-cms-4
return GeneralConfig::create()
    // Set the default week start day for date pickers (0 = Sunday, 1 = Monday, etc.)
    ->defaultWeekStartDay(1)
    // Prevent generated URLs from including "index.php"
    ->omitScriptNameInUrls()
    // Enable Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
    ->devMode($isDev)
    // Allow administrative changes
    ->allowAdminChanges($isDev)
    // Disallow robots
    ->disallowRobots(!$isProduction)

    // Allow template chaching
    ->enableTemplateCaching(!$isDev)

    // slugs without Umlaute
    ->limitAutoSlugsToAscii(true)
    // login adress of the cms
    ->cpTrigger('redaktion')
    // set cookies to lax
    ->sameSiteCookieValue('Lax')
    // https://craftcms.stackexchange.com/questions/23145/craft-not-loading-custom-404-template-for-errors
    ->errorTemplatePrefix('_errors/')
    
    // aliases _without_ getenv() for security reasons
    // https://craftcms.stackexchange.com/questions/36986/use-of-appenv-compared-to-getenv-since-craft-3-4-18
    ->aliases([
        '@web' => craft\helpers\App::env('BASE_URL'),
        '@webroot' => dirname(__DIR__) . '/web',
        '@assetBaseUrl' => craft\helpers\App::env('ASSETS_BASE_URL'),
        '@assetBasePath' => craft\helpers\App::env('ASSETS_BASE_PATH'),
    ])
;