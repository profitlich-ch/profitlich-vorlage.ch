var isDevToolsLoaded = false;
var isDevToolsShown = false;
var grid = 'lines';
var devDiv;
var devDivText;

if(docCookies.getItem('devTools')) {
    var devToolsArray = docCookies.getItem('devTools').split(',');
    if (devToolsArray[0] == 'true') {
        grid = devToolsArray[1];
        initialiseDevTools();
    }
}

function initialiseDevTools() {
    devDiv = document.createElement('div');
    devDiv.classList.add('dev-toolbar');
    devDiv.setAttribute('id', 'dev-toolbar');
    document.body.prepend(devDiv);
        
    devDivText = document.createElement('div');
    devDivText.classList.add('dev-toolbar__text');
    devDivText.setAttribute('id', 'dev-toolbar__text');
    devDiv.append(devDivText);
        
    let devDivRaster = document.createElement('div');
    devDivRaster.classList.add('dev-toolbar__grid');
    devDivRaster.setAttribute('id', 'dev-toolbar__grid');
    devDiv.append(devDivRaster);
    
    
    window.addEventListener('resize', updateDevDisplay);
    
    isDevToolsLoaded = true;
    devToolsUmschalten(true, grid);
    updateDevDisplay();
}

function updateDevDisplay() {
    if (isDevToolsShown === true) {
        windowHeight = window.innerHeight;
        windowWidth = window.innerWidth;
        devDivText.textContent = document.body.getAttribute('data-layout') + ' @ ' + windowWidth + '×' + windowHeight;
    }
}

var down = {};
document.addEventListener('keydown', (event) => {
    if (event.key === 'Control') {
        isDevToolsShown = document.body.getAttribute('data-dev') == 'true' ? 'false' : 'true';
        if (isDevToolsShown == 'true') {
            grid = grid == 'lines' ? 'ribbons' : 'lines';
        }
        devToolsUmschalten(isDevToolsShown, grid);
        if (isDevToolsLoaded === false) {
            initialiseDevTools();
        }
    }
});

function devToolsUmschalten(isOn, grid) {
    document.body.setAttribute('data-dev', isOn);
    document.body.setAttribute('data-dev-grid', grid);
    // docCookies.setItem(name, value[, end, path, domain, secure, samesite])
    docCookies.setItem('devTools', isOn + ',' + grid, new Date(2099, 1, 1), null, window.location.hostname, true, 'lax');
    isDevToolsShown = isOn;
}