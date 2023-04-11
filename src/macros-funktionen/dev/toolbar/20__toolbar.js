const body = document.body;
var isDevToolsGeladen = false;
var isDevToolsAnzeigen = false;
var devDiv;

if(docCookies.getItem('isDevTools')) {
    var isDevToolsCookie = docCookies.getItem('isDevTools');
    if (isDevToolsCookie == 'true') {
        devToolsInitialisieren();
    }
}

function devToolsInitialisieren() {
    devDiv = document.createElement('div');
        devDiv.classList.add('dev-toolbar');
        devDiv.setAttribute('id', 'dev-toolbar');
    document.body.prepend(devDiv);
    
    var observer = new MutationObserver(function(mutations) {
        devAnzeigeAktualisieren();
    });
    observer.observe(body, { 
        attributes: true, 
        attributeFilter: ['data-layout']
    });

    window.onresize = devAnzeigeAktualisieren;
    isDevToolsGeladen = true;

    devToolsUmschalten(true);
    devAnzeigeAktualisieren();
}

function devAnzeigeAktualisieren() {
    if (isDevToolsAnzeigen === true) {
        windowHeight = window.innerHeight;
        windowWidth = window.innerWidth;
        devDiv.textContent = document.body.getAttribute('data-layout') + ' @ ' + windowWidth + '×' + windowHeight;
    }
}

var down = {};
document.addEventListener('keydown', (event) => {
    if (event.key === 'Control') {
        isDevToolsAnzeigen = body.getAttribute('data-dev') == 'true' ? 'false' : 'true';
        devToolsUmschalten(isDevToolsAnzeigen);
        if (isDevToolsGeladen === false) {
            devToolsInitialisieren();
        }
    }
});

function devToolsUmschalten(isOn) {
    body.setAttribute('data-dev', isOn);
    // docCookies.setItem(name, value[, end, path, domain, secure, samesite])
    docCookies.setItem('isDevTools', isOn, new Date(2099, 1, 1), null, window.location.hostname, true, 'lax');
    isDevToolsAnzeigen = isOn;
}