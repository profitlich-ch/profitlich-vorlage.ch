// dev oder staging oder production
// staging lädt auf den Stagingserver
// production lädt auf den Produtivserver, lässt alle dev Inhalte weg (JS, CSS) und komprimiert JS
const modus = 'dev';

const path = require('path');
const { src, dest, watch, series, parallel, gulp } = require('gulp');
// const { readFileSync } = require('fs');

const autoprefixer = require('autoprefixer');
const cleanCSS     = require('gulp-clean-css');
const concat       = require('gulp-concat');
const del          = require('del');
const ftp          = require('vinyl-ftp');
const gulpif       = require('gulp-if');
const injectCSS    = require('gulp-inject-css');
const jsonCss      = require('gulp-json-css');
const log          = require('fancy-log');
const postcss	   = require('gulp-postcss');
const postcssEasingGradients = require('postcss-easing-gradients');
const replace      = require('gulp-replace');
const sass         = require('gulp-sass')(require('sass'));
const sassGlob     = require('gulp-sass-glob');
const sourcemaps   = require('gulp-sourcemaps');
const svgo         = require('gulp-svgo');
const svgSprite    = require('gulp-svg-sprite');
const terser       = require('gulp-terser');

var ftpVerbindungStaging = ftp.create({
    host: "",
    user: "",
    pass: "",
    parallel: 1
});

var ftpVerbindungProduction = ftp.create({
    host: "",
    user: "",
    pass: "",
    parallel: 1
});

// Dateipfade
const dateien = { 
    src: {
        src: 'src/**/*.*',
    },
    config: {
        src: 'src/_config.json',
        dest: 'src/scss',
    },
    scss: {
        src: ['src/scss/**/*.scss', 'src/macros/**/*.scss'],
        dest: 'web/css',
    },
    jsDefer: {
        src: (modus == 'dev') ? ['src/js/defer/**/*.js', 'src/macros/**/*.js'] : ['src/js/defer/**/*.js', 'src/macros/**/*.js', '!src/js/defer/dev/**/*.*'],
        dest: 'web/js',
    },
    jsInline: {
        src: (modus == 'dev') ? 'src/js/inline/**/*.js' : ['src/js/inline/**/*.js', '!src/js/inline/dev/**/*.*'],
        dest: 'templates/js',
    },
    jsBausteine: {
        src: ['src/bausteine/**/*.js', '!src/bausteine/**/_*.js'],
        dest: 'web/bausteine',
    },
    // https://stackoverflow.com/questions/28876469/multiple-file-extensions-within-the-same-directory-using-gulp
    templatesTwig: {
        src: 'src/templates/**/*.twig',
        dest: 'templates',
    },
    bausteineTwig: {
        src: 'src/bausteine/**/*.+(twig|js)',
        dest: 'templates/_bausteine',
    },
    bausteineAssets: {
        src: ['src/bausteine/**/*.+(svg|jpg|jpeg|gif|png|html)', '!src/bausteine/**/_*.*'],
        dest: 'web/bausteine',
    },
    // http://glivera-team.github.io/svg/2019/03/15/svg-sprites-2.en.html
    sprites: {
        src: 'src/bausteine/**/_*.svg',
        dest: 'web/sprites',
    },
    macros: {
        src: 'src/macros/**/*.twig',
        dest: 'templates/macros',
    },
    medien: {
        src: 'src/medien/**/*.*',
        dest: 'web/medien',
    },
    medienBackup: {
        src: 'src/medien/**/*.*',
        dest: 'backup/src/medien',
    },
    mockup: {
        src: 'src/mockup/**/*.*',
        dest: 'web/mockup',
    },
    fonts: {
        src: 'src/fonts/**/*.*',
        dest: 'web/fonts',
    },
    upload: {
        src: 'dist/**/*.*',
        destStaging: '/',
        destProduction: '/',
    },
    gulpConfig: {
        src: 'config/custom.php',
        dest: 'config',
    },
}

// Variablen aus config.json in SCSS umwandeln
function configTask() {
    return src(dateien.config.src)

    .pipe(jsonCss({
        keepObjects: true
    }))

    .pipe(dest
        (dateien.config.dest)
    )   
}

// Variablendatei _config.scss löschen
function configLoeschenTask() {
    return del('src/_config.scss');
}

// SCSS kompilieren
function scssTask() {
    return src(dateien.scss.src)

    // Nur der Fork von SimonHarte ermöglicht Objekte/Listen statt flacher Variablen
    .pipe(jsonCss({
        keepObjects: true
    }))

    // Globs lesen (wildcard)
    .pipe(sassGlob())
    
    // Sourcemaps initialisieren
    .pipe(sourcemaps.init())
    
    .pipe(sass())
    
    // Post CSS
    .pipe(postcss([
        autoprefixer(),
        postcssEasingGradients()
    ]))

    // Komprimieren mit Clean CSS
    .pipe(cleanCSS({
        mergeMediaQueries: true
    }))
    
    // Sourcemaps schreiben
    .pipe(sourcemaps.write('.'))
        
    // Dateien(en) schreiben
    .pipe(dest
        (dateien.scss.dest)
    )   
}

// JS Defer kompilieren
function jsDeferTask() {
    return src(dateien.jsDefer.src)

    // Sourcemaps initialisieren
    .pipe(sourcemaps.init())

    // Alle Dateien in einer zusammenfassen
    .pipe(concat('defer.js'))

    .pipe(dest
        (dateien.jsDefer.dest)
    )

    // Komprimieren mit Terser wenn nicht im dev Modus
    .pipe(gulpif( modus != 'dev', terser() ))

    // Sourcemaps schreiben
    .pipe(sourcemaps.write('.'))

    // Dateien(en) schreiben
    .pipe(dest
        (dateien.jsDefer.dest)
    )
}

// JS Inline kompilieren
function jsInlineTask() {
    return src(dateien.jsInline.src)

    // Sourcemaps initialisieren
    .pipe(sourcemaps.init())

    // Alle Dateien in einer zusammenfassen
    .pipe(concat('inline.js'))

    .pipe(dest
        (dateien.jsInline.dest)
    )

    // Komprimieren mit Terser wenn nicht im dev Modus
    .pipe(gulpif( modus != 'dev', terser() ))

    // Sourcemaps schreiben
    .pipe(sourcemaps.write('.'))

    // Dateien(en) schreiben
    .pipe(dest
        (dateien.jsInline.dest)
    )
}

// JS Bausteine kompilieren
function jsBausteineTask() {
    return src(dateien.jsBausteine.src)

    // Sourcemaps initialisieren
    .pipe(sourcemaps.init())

    .pipe(dest
        (dateien.jsBausteine.dest)
    )

    // Komprimieren mit Terser
    .pipe(gulpif( modus == 'production', terser() ))

    // Sourcemaps schreiben
    .pipe(sourcemaps.write('.'))

    // Dateien(en) schreiben
    .pipe(dest
        (dateien.jsBausteine.dest)
    )
}

// Templates Twig kopieren
function templatesTwigTask() {
    return src(dateien.templatesTwig.src)

    .pipe(dest
        (dateien.templatesTwig.dest)
    );
}

// Bausteine Twig kopieren
function bausteineTwigTask() {
    return src(dateien.bausteineTwig.src)

    .pipe(dest
        (dateien.bausteineTwig.dest)
    );
}

// Bausteine Assets kopieren
function bausteineAssetsTask() {
    return src(dateien.bausteineAssets.src)

    .pipe(dest
        (dateien.bausteineAssets.dest)
    );
}

// SVG Sprites bauen
function spritesTask() {
    return src(dateien.sprites.src)

    // SVG optimieren mit SVGO
    .pipe(svgo())

    // build svg sprite
    .pipe(svgSprite({
        mode: {
            symbol: {
                sprite: "../sprite.svg"
                // Die folgenden Zeilen sind dafür, SVG Eigenschaften einer SCSS Datei zu definieren
                // ,
                // render: {
                //     scss: {
                //         dest:'../../../sass/_sprite.scss',
                //         template: assetsDir + "sass/templates/_sprite_template.scss"
                //     }
                // }
            }
        },
        shape: {
            id: {
                generator: function(name) {
                    separator: "--";
                    // Der basename besteht aus dem Ordner, in dem das SVG ist, und dem Dateinamen, verbunden durch den separator.
                    // Der basename wird zu einem Array gewandelt und nur der hintere Teil verwendet (Dateiname)
                    // Der Unterstrich des Dateinamens wird entfernt
                    return path.basename(name.split(path.sep).pop().substring(1).replace(/\s+/g, this.whitespace), '.svg');
                }
            }
        }
    }))

    .pipe(dest
        (dateien.sprites.dest)
    );
}

// Macros kopieren
function macrosTask() {
    return src(dateien.macros.src)

    .pipe(dest
        (dateien.macros.dest)
    );
}

// Medien kopieren
function medienTask() {
    return src(dateien.medien.src)

    .pipe(dest
        (dateien.medien.dest)
    );
}

// Medien Backup auf NAS
function medienBackupTask() {
    del('backup/src');

    return src(dateien.medienBackup.src)

    .pipe(dest
        (dateien.medienBackup.dest)
    );
}

// Mockupmedien kopieren
function mockupTask() {
    return src(dateien.mockup.src)

    .pipe(dest
        (dateien.mockup.dest)
    );
}

// Fonts kopieren
function fontsTask() {
    return src(dateien.fonts.src)

    .pipe(dest
        (dateien.fonts.dest)
    );
}

// FTP
// https://medium.com/sliit-foss/automate-a-ftp-upload-with-gulp-js-4fde363cf9e8
// https://www.riklewis.com/2019/09/saving-time-with-ftp-in-gulp/
function uploadTask() {
    
    if (modus =='dev') {
        return src( dateien.upload.src, { base: '/', buffer: false } )
    
        .pipe(ftpVerbindungStaging.newer
            (dateien.upload.destStaging)
        ) 
        .pipe(ftpVerbindungStaging.dest
            (dateien.upload.destStaging)
        )
    }
    if (modus =='production') {
        return src( dateien.upload.src, { base: '/', buffer: false } )
    
        .pipe(ftpVerbindungProduction.newer
            (dateien.upload.destProduction)
        ) 
        .pipe(ftpVerbindungProduction.dest
            (dateien.upload.destProduction)
        )
    } else {
        return src( dateien.upload.src, { base: '/', buffer: false } )
    }
};


// Aufräumen
function aufraeumenTask() {
    return del('./dist');
}


// CSS injizieren
function injizierenTask() {
    return src('dist/**/*.{html,twig}')
    .pipe(injectCSS())
    .pipe(dest('dist'));
}

// Versionsnummer staticAssetsVersion setzen
function staticAssetsVersionTask() {
    return src(dateien.gulpConfig.src)
    .pipe(gulpif( modus == 'production', 
        replace(/'staticAssetsVersion' => (\d+),/g, function(match, p1, offset, string) {
        unixZeit = Math.floor(new Date().getTime() / 1000);
        log('-> staticAssetsVersion geändert zu ' + unixZeit);
        return "'staticAssetsVersion' => " + unixZeit + ",";
        }))
    )
    .pipe(dest
        (dateien.gulpConfig.dest)
    );
}


// Änderungen beobachten
function watchTask() {
    watch(
        [dateien.src.src],
        series(
            // aufraeumenTask,
            configTask,
            parallel(
                templatesTwigTask, bausteineTwigTask, bausteineAssetsTask, jsBausteineTask, macrosTask, scssTask, jsDeferTask, jsInlineTask, medienTask, mockupTask, fontsTask, spritesTask, staticAssetsVersionTask
            ),
            configLoeschenTask,
            injizierenTask,
            uploadTask,
        )
    );
}

// Standardaufgabe anlegen
exports.default = series (
    series(
        // aufraeumenTask,
        configTask,
        parallel(
            templatesTwigTask, bausteineTwigTask, bausteineAssetsTask, jsBausteineTask, macrosTask, scssTask, jsDeferTask, jsInlineTask, medienTask, mockupTask, fontsTask, spritesTask, staticAssetsVersionTask
        ),
        configLoeschenTask,
        injizierenTask,
        uploadTask,
    ),
    watchTask,
);