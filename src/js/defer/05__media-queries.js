// Media queries
// https://kinsta.com/blog/javamediaqueryipt-media-query/
// Option 3 auf der Seite

// media query change events
var layoutAktuell;
for (let [layout, minSize] of Object.entries(config.breakpoints)) {
    if (minSize) {
        var matchmedia = window.matchMedia('(min-width: ' + minSize + 'px)');
        matchmedia.addEventListener('change', layoutAendern);
    }
}

// media query handler function
function layoutAendern() {
    // let size = null;
    for (let [layout, minSize] of Object.entries(config.breakpoints)) {
        var matchmedia = window.matchMedia('(min-width: ' + minSize + 'px)');
        if (!matchmedia || matchmedia.matches) layoutAktuell = layout;
    }
    document.body.setAttribute('data-layout', layoutAktuell);

    // Event erstellen
    let event = new CustomEvent('eventLayoutaenderung', {
        detail: {
            layout: layoutAktuell
        }
    });
    // dispatch the event
    document.dispatchEvent(event);
}

// Beim Laden der Seite initial aufrufen
layoutAendern();