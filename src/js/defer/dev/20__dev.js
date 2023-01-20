const body = document.body;
var isDevToolsGeladen = false;
var isDevToolsAnzeigen = false;

if(docCookies.getItem('isDevTools')) {
    var isDevToolsCookie = docCookies.getItem('isDevTools');
    if (isDevToolsCookie == 'true') {
        devToolsInitialisieren();
    }
}

function devToolsInitialisieren() {
    const devDiv = document.createElement('div');
        devDiv.classList.add('dev');
        devDiv.setAttribute('id', 'dev');
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
    docCookies.setItem('isDevTools', isOn, new Date(2099, 1, 1), 'lax', window.location.hostname, true);
    isDevToolsAnzeigen = isOn;
}