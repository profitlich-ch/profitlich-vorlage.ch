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


// Body Attribute scrolled = true geben, wenn gescrollt wurde
document.addEventListener('scroll', function gescrollt() {
    document.body.setAttribute('data-scrolled', 'true');
    this.removeEventListener('scroll', gescrollt);
});


// Weiches Scrollen
// Scrollziel ist in Pixeln ohne px gemessen vom oberen Rand
// Beispiel: An Seitenanfagg scrollen: 0
function scrollen(ziel, scrollgeschwindigkeit = 500, abstand = 0) {

    var scrollposition = window.scrollY;

    $('html, body').animate(
        {
            scrollTop: ziel - abstand + scrollposition
        },
    scrollgeschwindigkeit);

}