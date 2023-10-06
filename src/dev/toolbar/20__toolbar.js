const body = document.body;
var isDevToolsGeladen = false;
var isDevToolsAnzeigen = false;
var rasterart = 'linien';
var devDiv;
var devDivText;

if(docCookies.getItem('devTools')) {
    var devToolsArray = docCookies.getItem('devTools').split(',');
    if (devToolsArray[0] == 'true') {
        rasterart = devToolsArray[1];
        devToolsInitialisieren();
    }
}

function devToolsInitialisieren() {
    devDiv = document.createElement('div');
        devDiv.classList.add('dev-toolbar');
        devDiv.setAttribute('id', 'dev-toolbar');
    document.body.prepend(devDiv);
        
    devDivText = document.createElement('div');
        devDivText.classList.add('dev-toolbar__text');
        devDivText.setAttribute('id', 'dev-toolbar__text');
    devDiv.append(devDivText);
        
    let devDivRaster = document.createElement('div');
        devDivRaster.classList.add('dev-toolbar__raster');
        devDivRaster.setAttribute('id', 'dev-toolbar__raster');
    devDiv.append(devDivRaster);
    
    
    window.addEventListener('resize', devAnzeigeAktualisieren);
    
    isDevToolsGeladen = true;
    devToolsUmschalten(true, rasterart);
    devAnzeigeAktualisieren();
}

function devAnzeigeAktualisieren() {
    if (isDevToolsAnzeigen === true) {
        windowHeight = window.innerHeight;
        windowWidth = window.innerWidth;
        devDivText.textContent = document.body.getAttribute('data-layout') + ' @ ' + windowWidth + '×' + windowHeight;
    }
}

var down = {};
document.addEventListener('keydown', (event) => {
    if (event.key === 'Control') {
        isDevToolsAnzeigen = body.getAttribute('data-dev') == 'true' ? 'false' : 'true';
        if (isDevToolsAnzeigen == 'true') {
            rasterart = rasterart == 'linien' ? 'flaechen' : 'linien';
        }
        devToolsUmschalten(isDevToolsAnzeigen, rasterart);
        if (isDevToolsGeladen === false) {
            devToolsInitialisieren();
        }
    }
});

function devToolsUmschalten(isOn, rasterart) {
    body.setAttribute('data-dev', isOn);
    body.setAttribute('data-dev-rasterart', rasterart);
    // docCookies.setItem(name, value[, end, path, domain, secure, samesite])
    docCookies.setItem('devTools', isOn + ',' + rasterart, new Date(2099, 1, 1), null, window.location.hostname, true, 'lax');
    isDevToolsAnzeigen = isOn;
}