<?php
    // https://craftcms.com/docs/4.x/config/#custom-settings
    // https://nystudio107.com/blog/simple-static-asset-versioning
    return array(

        // All environments
        '*' => array(
            
        ),
        
        // production environment
        'production'  => array(
            'staticAssetsVersion' => 1696361787,
        ),

        // staging environment
        'staging'  => array(
            'staticAssetsVersion' => time(),
        ),

        // development environment
        'dev'  => array(
            'staticAssetsVersion' => time(),
        ),
    );

;