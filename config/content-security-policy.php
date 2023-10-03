<?php

return [
    'enabled' => false,
    
    'reportOnly' => false,

    'scriptSrc' => [
        "https://*.googleapis.com https://*.gstatic.com *.google.com https://*.ggpht.com *.googleusercontent.com blob:",
    ],
    'styleSrc' => [
        "https://use.typekit.net https: *.googleapis.com",
    ],
    'imgSrc' => [
        "'self' https://i.vimeocdn.com https://*.googleapis.com https://*.gstatic.com *.google.com *.googleusercontent.com data:",
    ],
    'connectSrc' => [
        "https://*.googleapis.com *.google.com https://*.gstatic.com data: blob:",
    ],
    'workerSrc' => [
        "blob:",
    ],
    'frameSrc' => [
        "https://*.vimeo.com https://*.google.com",
    ],
    'objectSrc' => [
        "'none'",
    ],
];