// Media queries
// https://kinsta.com/blog/javascript-media-query/
// Option 3

// media query change events
for (let [scr, mq] of Object.entries(layouts)) {
    if (mq) mq.addEventListener('change', mediaquery);
}

// media query handler function
function mediaquery() {

    let size = null;
    for (let [scr, mq] of Object.entries(layouts)) {
    if (!mq || mq.matches) layout = scr;
    }

    document.body.setAttribute('data-layout', layout);

}

// Beim Laden der Seite initial aufrufen
mediaquery();