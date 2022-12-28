// dev oder staging oder production
// staging lädt auf den Stagingserver
// production lädt auf den Produtivserver, lässt alle dev Inhalte weg (JS, CSS) und komprimiert JS
const modus = 'dev';

const path = require('path');
const { src, dest, watch, series, parallel, gulp } = require('gulp');
const { readFileSync } = require('fs');

const autoprefixer = require('autoprefixer');
const cleanCSS     = require('gulp-clean-css');
const concat       = require('gulp-concat');
const del          = require('del');
const ftp          = require('vinyl-ftp');
const gulpif       = require('gulp-if');
const injectCSS    = require('gulp-inject-css');
const postcss	   = require('gulp-postcss');
const postcssEasingGradients = require('postcss-easing-gradients');
const rename       = require('gulp-rename');
const replace      = require('gulp-replace');
const rev          = require('gulp-rev');
const revrewrite   = require('gulp-rev-rewrite');
const sass         = require('gulp-sass')(require('sass'));
const sassGlob     = require('gulp-sass-glob');
const sourcemaps   = require('gulp-sourcemaps');
const svgo         = require('gulp-svgo');
const svgSprite    = require('gulp-svg-sprite');
const terser       = require('gulp-terser');

var ftpVerbindungDevelopment = ftp.create({
    host: "",
    user: "",
    pass: "",
    parallel: 1
});

var ftpVerbindungStaging = ftp.create({
var ftpVerbindungStaging = ftp.create({
    host: "",
    user: "",
    pass: "",
    parallel: 1
});

var ftpVerbindungProduction = ftp.create({
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
    scss: {
        src: 'src/scss/**/*.scss',
        dest: 'web/css',
    },
    
    jsDefer: {
        src: (modus == 'dev') ? 'src/js/defer/**/*.js' : ['src/js/defer/**/*.js', '!src/js/defer/dev/**/*.*'],
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
}

// SCSS kompilieren
function scssTask() {
    return src(dateien.scss.src)

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

    // Alle Dateien in einer zusammenfassen
    .pipe(concat('defer.js'))

    .pipe(dest
        (dateien.jsDefer.dest)
    )

    // Komprimieren mit Terser wenn nicht im dev Modus
    .pipe(gulpif( modus != 'dev', terser() ))

    // Dateien(en) schreiben
    .pipe(dest
        (dateien.jsDefer.dest)
    )
}

// JS Inline kompilieren
function jsInlineTask() {
    return src(dateien.jsInline.src)

    .pipe(concat('inline.js'))

    .pipe(dest
        (dateien.jsInline.dest)
    )

    // Komprimieren mit Terser wenn nicht im dev Modus
    .pipe(gulpif( modus != 'dev', terser() ))

    // Dateien(en) schreiben
    .pipe(dest
        (dateien.jsInline.dest)
    )
}

// JS Bausteine kompilieren
function jsBausteineTask() {
    return src(dateien.jsBausteine.src)

    .pipe(dest
        (dateien.jsBausteine.dest)
    )

    // Komprimieren mit Terser
    .pipe(gulpif( modus == 'production', terser() ))
    .pipe(gulpif( modus == 'production', terser() ))

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
    
    if (modus == 'staging') {
        return src( dateien.upload.src, { base: 'dist', buffer: false } )
    
        .pipe(ftpVerbindungStaging.newer
            (dateien.upload.destStaging)
        .pipe(ftpVerbindungDevelopment.newer
            (dateien.upload.destDev)
        ) 
        .pipe(ftpVerbindungDevelopment.dest
            (dateien.upload.destDev)
        )
    }
    
    if (modus =='production') {
        return src( dateien.upload.src, { base: 'dist', buffer: false } )
    
        .pipe(ftpVerbindungProduction.newer
            (dateien.upload.destProduction)
        ) 
        .pipe(ftpVerbindungProduction.dest
            (dateien.upload.destProduction)
        )
    } else {
        return src( dateien.upload.src, {
            base: 'dist',
            buffer: false
        } )
    }
};


// Revisionieren
function revisionierenTask() {
    
    if (modus !='dev') {
        
        return src('web/**/*.{css,js,svg,jpg,png,eot,ttf,otf,woff,woff2}')

        // Hash anfügen mit Gulp Rev
        .pipe(rev())
        // Dateien(en) schreiben
        .pipe(dest('web'))

        .pipe(rev.manifest({
            merge: true
        }))

        // Alte gehashte Dateien löschen
        // .pipe(revdel())

        .pipe(replace('web/', ''))
        .pipe(dest('web'))
        
    } else {
        return src('/web/**/*.*')
    }
}


// Revisionen in Dateien schreiben
function revschreibenTask() {
    
    if (modus !='dev') {
        
        const manifest = readFileSync('web/rev-manifest.json');

        return src('dist/**/*.{twig,css,js}')
        .pipe(revrewrite({ manifest }))
        .pipe(dest('dist'));
    } else {
        return src('/dist/**/*.*')
    }
}


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


// Änderungen beobachten
function watchTask() {
    watch(
        [dateien.src.src],
        series(
            aufraeumenTask,
            // importJsonTask,
            parallel(
                templatesTwigTask, bausteineTwigTask, bausteineAssetsTask, jsBausteineTask, macrosTask, scssTask, jsDeferTask, jsInlineTask, medienTask, mockupTask, fontsTask, spritesTask
            ),
            injizierenTask,
            revisionierenTask,
            revschreibenTask,
            uploadTask,
        )
    );
}

// Standardaufgabe anlegen
exports.default = series (
    series(
        aufraeumenTask,
        // importJsonTask,
        parallel(
            templatesTwigTask, bausteineTwigTask, bausteineAssetsTask, jsBausteineTask, macrosTask, scssTask, jsDeferTask, jsInlineTask, medienTask, mockupTask, fontsTask, spritesTask
        ),
        injizierenTask,
        revisionierenTask,
        revschreibenTask,
        uploadTask,
    ),
    watchTask,
);