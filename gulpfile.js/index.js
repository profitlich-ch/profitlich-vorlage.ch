const path = require('path');

const { src, dest, watch, series, parallel, gulp } = require('gulp');
const { readFileSync } = require('fs');

const autoprefixer = require('autoprefixer');
const babel        = require('gulp-babel');
const browsersync  = require('browser-sync').create();
const cleanCSS     = require('gulp-clean-css');
const concat       = require('gulp-concat');
const del          = require('del');
const flatten      = require('gulp-flatten');
const ftp          = require('vinyl-ftp');
const gulpif       = require('gulp-if');
const injectCSS    = require('gulp-inject-css');
const postcss	   = require('gulp-postcss');
const postcssObjectFitImages = require('postcss-object-fit-images');
const postcssEasingGradients = require('postcss-easing-gradients');
const realFavicon  = require ('gulp-real-favicon');
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
const webpack      = require('webpack-stream');


// lokal oder dev oder live
// lokal nutzt Browsersync
// dev lädt auf den Entwicklungsserver
// live lädt auf den Live Server, lässt alle dev Inhalte weg (JS, CSS) und komprimiert JS
const modus = 'lokal';


var ftpVerbindungDev = ftp.create({
    host: "",
    user: "",
    pass: "",
    parallel: 1
});

var ftpVerbindungLive = ftp.create({
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
        src: (modus == 'dev' || modus == 'lokal') ? 'src/scss/**/*.scss' : ['src/scss/**/*.scss', '!src/scss/dev/**.*'],
        dest: 'web/css',
    },
    
    js: {
        // src: (modus == 'dev' || modus == 'lokal') ? 'src/js/**/*.js' : ['src/js/**/*.js', '!src/js/dev/**.*'],
        src: 'src/js/javascript.js',
        dest: 'web/js',
    },
    
    jsBausteine: {
        src: 'src/bausteine/**/*.js',
        dest: 'web/bausteine',
    },
    
    // https://stackoverflow.com/questions/28876469/multiple-file-extensions-within-the-same-directory-using-gulp
    templatesTwig: {
        src: 'src/templates/**/*.twig',
        dest: 'templates',
    },

    bausteineTwig: {
        src: 'src/bausteine/**/*.twig',
        dest: 'templates/_bausteine',
    },

    bausteineAssets: {
        src: 'src/bausteine/**/*.+(svg|jpg|jpeg|gif|png|html)',
        dest: 'templates/_bausteine',
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
    
    mockup: {
        src: 'src/mockup/**/*.*',
        dest: 'web/mockup',
    },
    
    fonts: {
        src: 'src/fonts/**/*.*',
        dest: 'web/fonts',
    },
    
    favicon: {
        src: 'src/favicon/favicon.svg',
        html: 'src/favicon/*.html',
        dest: 'web/favicon',
        dataFile: 'src/favicon/faviconData.json',
    },
    
    upload: {
        src: 'dist/**/*.*',
        destDev: '/',
        destLive: '/',
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
    
    // Media Queries auf eigene Dateien aufteilen
    // https://github.com/Riant/gulp-extract-media-queries2
    // .pipe(extractmq())

    // Post CSS: object-fit, Autoprefixer
    .pipe(postcss([
        autoprefixer(),
        postcssObjectFitImages(),
        postcssEasingGradients()
    ]))
    
    // Sourcemaps schreiben
    .pipe(sourcemaps.write('.'))

    // Komprimieren mit Clean CSS
    .pipe(cleanCSS({
        mergeMediaQueries: true
    }))
    
    // Dateien(en) schreiben
    .pipe(dest
        (dateien.scss.dest)
    )
        
}

// JS kompilieren
function jsTask() {

    return src(dateien.js.src)

    // .pipe(concat('domscript.js'))

    .pipe(
        webpack({
            
        })
    )

    .pipe(dest
        (dateien.js.dest)
    )

    // Datei in min umbenennen
    .pipe(rename('javascript.min.js'))

    // Komprimieren mit Terser wenn im live modus
    .pipe(gulpif( modus != 'dev' && modus != 'lokal', terser() ))

    // Dateien(en) schreiben
    .pipe(dest
        (dateien.js.dest)
    )

}

// JS Bausteine kompilieren
function jsBausteineTask() {

    return src(dateien.jsBausteine.src)

    .pipe(dest
        (dateien.jsBausteine.dest)
    )

    // Komprimieren mit Terser
    .pipe(gulpif( modus == 'live', terser() ))

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

    // .pipe(flatten())

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

        return src( dateien.upload.src, { base: 'dist', buffer: false } )
    
        .pipe(ftpVerbindungDev.newer
            (dateien.upload.destDev)
        ) 
        .pipe(ftpVerbindungDev.dest
            (dateien.upload.destDev)
        )

        // https://github.com/morris/vinyl-ftp/issues/61
        // 
        // .pipe(
        //     ftpVerbindungDev.clean(
        //         [
        //             '/workspace/bausteine/*.*',
        //             '/workspace/css/*.*',
        //             '/workspace/fonts/*.*',
        //             '/workspace/js/*.*',
        //             '/workspace/js/*.*',
        //             '/workspace/medien/*.*',
        //             '/workspace/sprites/*.*',
        //         ],
        //         '.dist/workspace',
        //         { base: 'workspace' }
        //     )
        // );

    }
    
    if (modus =='live') {

        return src( dateien.upload.src, { base: 'dist', buffer: false } )
    
        .pipe(ftpVerbindungLive.newer
            (dateien.upload.destLive)
        ) 
        .pipe(ftpVerbindungLive.dest
            (dateien.upload.destLive)
        )

    } else {

        return src( dateien.upload.src, { base: 'dist', buffer: false } )

    }

};


// Revisionieren
function revisionierenTask() {
    
    if (modus !='lokal') {
        
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
    
    if (modus !='lokal') {
        
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
            parallel(
                templatesTwigTask, bausteineTwigTask, bausteineAssetsTask, jsBausteineTask, macrosTask, scssTask, jsTask, medienTask, mockupTask, fontsTask, spritesTask
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
        parallel(
            templatesTwigTask, bausteineTwigTask, bausteineAssetsTask, jsBausteineTask, macrosTask, scssTask, jsTask, medienTask, mockupTask, fontsTask, spritesTask
        ),
        injizierenTask,
        revisionierenTask,
        revschreibenTask,
        uploadTask,
    ),
    watchTask,
);


// Generate the icons. This task takes a few seconds to complete.
// You should run it at least once to create the icons. Then,
// you should run it whenever RealFaviconGenerator updates its
// package (see the check-for-favicon-update task below).
function generateFavicon(done) {
	realFavicon.generateFavicon({
		masterPicture: dateien.favicon.src,
		dest: dateien.favicon.dest,
		iconsPath: '/',
		design: {
			ios: {
				masterPicture: {
					type: 'inline',
					content: 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJhIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNSAzNSI+PGRlZnM+PHN0eWxlPi5ke2ZpbGw6IzliNjQ1YTt9PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImIiPjxyZWN0IGNsYXNzPSJkIiB4PSIxNi45OSIgd2lkdGg9IjEuMDIiIGhlaWdodD0iMzUiLz48L2c+PGcgaWQ9ImMiPjxyZWN0IGNsYXNzPSJkIiB5PSIxNi45OSIgd2lkdGg9IjM1IiBoZWlnaHQ9IjEuMDIiLz48L2c+PC9zdmc+'
				},
				pictureAspect: 'backgroundAndMargin',
				backgroundColor: '#ffffff',
				margin: '14%',
				assets: {
					ios6AndPriorIcons: false,
					ios7AndLaterIcons: false,
					precomposedIcons: false,
					declareOnlyDefaultIcon: true
				},
				appName: 'Appname'
			},
			desktopBrowser: {
				design: 'background',
				backgroundColor: '#34f063',
				backgroundRadius: 0.5,
				imageScale: 0.8
			},
			windows: {
				masterPicture: {
					type: 'inline',
					content: 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJhIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzOCAzOCI+PGRlZnM+PHN0eWxlPi5ie2ZpbGw6IzliNjQ1YTt9PC9zdHlsZT48L2RlZnM+PHBhdGggY2xhc3M9ImIiIGQ9Ik0xOSwzOEM4LjUyLDM4LDAsMjkuNDgsMCwxOVM4LjUyLDAsMTksMHMxOSw4LjUyLDE5LDE5LTguNTIsMTktMTksMTlaTTE5LDEuM0M5LjI0LDEuMywxLjMsOS4yNCwxLjMsMTlzNy45NCwxNy43LDE3LjcsMTcuNywxNy43LTcuOTQsMTcuNy0xNy43UzI4Ljc2LDEuMywxOSwxLjNaIi8+PHBvbHlnb24gY2xhc3M9ImIiIHBvaW50cz0iMjQuODQgMTguODcgMTkuNDggMjQuMjMgMTkuNDggMTAuNTkgMTguMTggMTAuNTkgMTguMTggMjQuMjQgMTIuODIgMTguODcgMTEuOSAxOS43OSAxOC44MyAyNi43MiAyNS43NiAxOS43OSAyNC44NCAxOC44NyIvPjwvc3ZnPg=='
				},
				pictureAspect: 'noChange',
				backgroundColor: '#a030a0',
				onConflict: 'override',
				assets: {
					windows80Ie10Tile: false,
					windows10Ie11EdgeTiles: {
						small: false,
						medium: true,
						big: false,
						rectangle: false
					}
				},
				appName: 'Appname'
			},
			androidChrome: {
				masterPicture: {
					type: 'inline',
					content: 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJhIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzOCAzOCI+PGRlZnM+PHN0eWxlPi5ie2ZpbGw6IzliNjQ1YTt9PC9zdHlsZT48L2RlZnM+PHBhdGggY2xhc3M9ImIiIGQ9Ik0xOSwzOEM4LjUyLDM4LDAsMjkuNDgsMCwxOVM4LjUyLDAsMTksMHMxOSw4LjUyLDE5LDE5LTguNTIsMTktMTksMTlaTTE5LDEuM0M5LjI0LDEuMywxLjMsOS4yNCwxLjMsMTlzNy45NCwxNy43LDE3LjcsMTcuNywxNy43LTcuOTQsMTcuNy0xNy43UzI4Ljc2LDEuMywxOSwxLjNaIi8+PHBvbHlnb24gY2xhc3M9ImIiIHBvaW50cz0iMjQuODQgMTguODcgMTkuNDggMjQuMjMgMTkuNDggMTAuNTkgMTguMTggMTAuNTkgMTguMTggMjQuMjQgMTIuODIgMTguODcgMTEuOSAxOS43OSAxOC44MyAyNi43MiAyNS43NiAxOS43OSAyNC44NCAxOC44NyIvPjwvc3ZnPg=='
				},
				pictureAspect: 'backgroundAndMargin',
				margin: '17%',
				backgroundColor: '#4567f3',
				themeColor: '#4567f3',
				manifest: {
					name: 'Appname',
					display: 'standalone',
					orientation: 'notSet',
					onConflict: 'override',
					declared: true
				},
				assets: {
					legacyIcon: false,
					lowResolutionIcons: false
				}
			},
			safariPinnedTab: {
				masterPicture: {
					type: 'inline',
					content: 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJhIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzOCAzOCI+PGRlZnM+PHN0eWxlPi5ie2ZpbGw6IzliNjQ1YTt9PC9zdHlsZT48L2RlZnM+PHBhdGggY2xhc3M9ImIiIGQ9Ik0xOSwzOEM4LjUyLDM4LDAsMjkuNDgsMCwxOVM4LjUyLDAsMTksMHMxOSw4LjUyLDE5LDE5LTguNTIsMTktMTksMTlaTTE5LDEuM0M5LjI0LDEuMywxLjMsOS4yNCwxLjMsMTlzNy45NCwxNy43LDE3LjcsMTcuNywxNy43LTcuOTQsMTcuNy0xNy43UzI4Ljc2LDEuMywxOSwxLjNaIi8+PHBvbHlnb24gY2xhc3M9ImIiIHBvaW50cz0iMjQuODQgMTguODcgMTkuNDggMjQuMjMgMTkuNDggMTAuNTkgMTguMTggMTAuNTkgMTguMTggMjQuMjQgMTIuODIgMTguODcgMTEuOSAxOS43OSAxOC44MyAyNi43MiAyNS43NiAxOS43OSAyNC44NCAxOC44NyIvPjwvc3ZnPg=='
				},
				pictureAspect: 'silhouette',
				themeColor: '#ff00a0'
			}
		},
		settings: {
			scalingAlgorithm: 'Mitchell',
			errorOnImageTooSmall: false,
			readmeFile: false,
			htmlCodeFile: false,
			usePathAsIs: false
		},
		markupFile: dateien.favicon.dataFile
	}, function() {
		done();
	});
}

// Inject the favicon markups in your HTML pages. You should run
// this task whenever you modify a page. You can keep this task
// as is or refactor your existing HTML pipeline.
function injectFaviconMarkups() {
	return src(['src/html/favicon.html'])
		.pipe(realFavicon.injectFaviconMarkups(JSON.parse(readFileSync(dateien.favicon.dataFile)).favicon.html_code))
		.pipe(dest('src/favicon'));
}

// Check for updates on RealFaviconGenerator (think: Apple has just
// released a new Touch icon along with the latest version of iOS).
// Run this task from time to time. Ideally, make it part of your
// continuous integration system.
function checkForFaviconUpdate(done) {
	var currentVersion = JSON.parse(readFileSync.readFileSync(dateien.favicon.dataFile)).version;
	realFavicon.checkForUpdates(currentVersion, function(err) {
		if (err) {
			throw err;
		}
	});
}

exports.generateFavicon = generateFavicon;
exports.injectFaviconMarkups = injectFaviconMarkups;
exports.checkForFaviconUpdate = checkForFaviconUpdate;