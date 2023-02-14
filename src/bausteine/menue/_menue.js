var menueAktiv = false;
var hamburger = document.getElementById('hamburger');

var y = 0;
function menueToggle() {
    if (menueAktiv == true) {
        // Prüfen, ob Variable existiert
        menueAktiv = false;
        document.body.removeEventListener('click', menueBodyClick);
        document.body.setAttribute('data-menue-aktiv', menueAktiv);
        menueSeiteHover(false);
        hamburger.style.marginRight = '';
        document.body.style.paddingRight = '';
        document.body.style.top = '';
        window.scrollTo(0, y);
    } else {
        menueAktiv = true;
        // Klick ausserhalb des Menüs
        document.body.addEventListener('click', menueBodyClick);
        scrollbar = window.innerWidth - document.documentElement.clientWidth;
        y = window.scrollY;
        document.body.setAttribute('data-menue-aktiv', menueAktiv);
        var marginOriginal = parseFloat(window.getComputedStyle(hamburger).marginRight);
        hamburger.style.marginRight = marginOriginal + scrollbar + 'px';
        document.body.style.paddingRight = scrollbar + 'px';
        document.body.style.top = -y + 'px';
    }
}

function menueBodyClick(event) {
    if (menueAktiv == true) {
        if (!event.target.closest('.header__menue')) {
            menueToggle();
        }
    }
}

function menueSeiteHover(event) {
    if (event.type == 'mouseenter') {
        document.body.setAttribute('data-seite-hover', 'true');
    } else {
        document.body.setAttribute('data-seite-hover', 'false');
    }
}

// Hamburgermenü aktivieren
hamburger.addEventListener('click', event => {
    event.preventDefault();
    event.stopPropagation();
    menueToggle();
});

var menue = document.getElementById('menue');
menue.addEventListener('click', event => {
    if (menueAktiv == true) {
        const { target } = event;
        if (target.matches('.menue__link')) {
            menueToggle();
        }
    }
});