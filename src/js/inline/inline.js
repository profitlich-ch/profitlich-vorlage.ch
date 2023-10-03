// Debounce Funktion
// https://davidwalsh.name/javascript-debounce-function
// Returns a function, that, as long as it continues to be invoked, will not
// be triggered. The function will be called after it stops being called for
// N milliseconds. If `immediate` is passed, trigger the function on the
// leading edge, instead of the trailing.

// var myEfficientFn = debounce(function() {
// All the taxing stuff you do
// }, 250);
// window.addEventListener('resize', myEfficientFn);

function debounce(func, wait, immediate) {
    var timeout;
    return function () {
        var context = this, args = arguments;
        var later = function () {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
    };
};

// E-Mailadressen anzeigen
function emailAdressen() {
    const emlArray = document.querySelectorAll('[data-eml]').forEach(adresse => {
        let eml = adresse.getAttribute('data-eml');
        let emlDomain = 'studioc-architekten.ch';
        let emlText = eml+'@'+emlDomain;
        let emlAddress = 'mailto:'+emlText;
        adresse.setAttribute('href', emlAddress);
        adresse.innerHTML = `
            ${eml}<span class="mail-at">@</span>${emlDomain}
        `;
    });
}
emailAdressen();

// 100vh Problem
// https://css-tricks.com/the-trick-to-viewport-units-on-mobile/

function vh() {
    // First we get the viewport height and we multiple it by 1% to get a value for a vh unit
    let vh = window.innerHeight * 0.01;
    // Then we set the value in the --vh custom property to the root of the document
    document.documentElement.style.setProperty('--vh', `${vh}px`);
}
vh();

// We listen to the resize event
window.addEventListener('resize', () => {
    vh();
});