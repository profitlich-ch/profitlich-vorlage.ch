// Media queries
// https://kinsta.com/blog/javamediaqueryipt-media-query/
// option 3 on the linked page

// media query change events
var currentLayout;
for (let [layout, minSize] of Object.entries(config.breakpoints)) {
    if (minSize) {
        var matchmedia = window.matchMedia('(min-width: ' + minSize + 'px)');
        matchmedia.addEventListener('change', changeLayout);
    }
}

// media query handler function
function changeLayout() {
    // let size = null;
    for (let [layout, minSize] of Object.entries(config.breakpoints)) {
        var matchmedia = window.matchMedia('(min-width: ' + minSize + 'px)');
        if (!matchmedia || matchmedia.matches) currentLayout = layout;
    }
    document.body.setAttribute('data-layout', currentLayout);

    // create event
    let event = new CustomEvent('eventLayoutchange', {
        detail: {
            layout: currentLayout
        }
    });
    // dispatch the event
    document.dispatchEvent(event);
}

// load initially when page loads
changeLayout();