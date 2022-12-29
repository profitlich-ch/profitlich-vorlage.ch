var menueAktiv = false;
const seite = document.getElementById('seite');
const hamburger = document.getElementById('hamburger')

// Alle Elemente finden, die tatsächlich sticky sind
var stickyElemente = [];
function stickyElementeFinden() {
    var stickyElementeAlle = document.querySelector('[data-sticky]');
    if (stickyElementeAlle) {
        for (let i = 0; i < stickyElementeAlle.length; i++) {
            if (window.getComputedStyle(stickyElementeAlle[i]).position = 'sticky') {
                stickyElemente.push(stickyElementeAlle[i]);
            }
        }
    }
}
stickyElementeFinden();

var y = 0;
const stickyElementeTop = [];
const nebeninformationDesktop = document.getElementById('projekt__nebeninformation--desktop');
function menueToggle() {
    if (menueAktiv == false) {
        if (typeof scrolltrigger != 'undefined') {
            scrolltrigger.disable(false);
        }
        // Sticky Elemente auf position fixed setzen
        if (typeof stickyElemente != 'undefined') {
            for (let i = 0; i < stickyElemente.length; i++) {
                // Bestehende top Position in Array speichern, um sie beim Deaktivieren des Menüs wiederherzustellen
                var stickyElementStyles = window.getComputedStyle(stickyElemente[i]);
                console.log(stickyElementStyles);
                stickyElementeTop[i] = stickyElementStyles.top;
                
                // Element statt sticky neu fixed positionieren
                // Dafür muss der top-Wert auf den tatsächlichen Abstand zum viewport gesetzt werden
                var stickyElementTop = stickyElemente[i].getBoundingClientRect().top;
                stickyElemente[i].setAttribute('top', stickyElementTop);
                stickyElemente[i].setAttribute('position', 'fixed');
            }
        }
        menueAktiv = true;
        // Klick ausserhalb des Menüs
        document.body.addEventListener('click', menueBodyClick);
        // Hover ausserhalb des Menüs
        seite.addEventListener('mouseenter', menueSeiteHover);
        seite.addEventListener('mouseleave', menueSeiteHover);
        scrollbar = window.innerWidth - document.documentElement.clientWidth;
        y = window.scrollY;
        document.body.setAttribute('data-menue-aktiv', menueAktiv);
        hamburger.style.marginRight = scrollbar + 'px';
        document.body.style.paddingRight = scrollbar + 'px';
        document.body.style.top = -y + 'px';
        // projekt.js
        if (nebeninformationDesktop) {
            nebeninformationDesktop.style.position = 'fixed';
        }
    } else {
        // Prüfen, ob Variable existiert
        if (typeof scrolltrigger != 'undefined') {
            scrolltrigger.enable(false);
        }
        // Sticky Elemente sticky schalten
        if (typeof stickyElemente != 'undefined') {
            for (let i = 0; i < stickyElemente.length; i++) {
                stickyElemente.setAttribute('top', stickyElementeTop[i]);
                stickyElemente.setAttribute('position', 'sticky');
            }
        }
        menueAktiv = false;
        document.body.removeEventListener('click', menueBodyClick);
        seite.removeEventListener('mouseenter', menueSeiteHover);
        seite.removeEventListener('mouseleave', menueSeiteHover);
        document.body.setAttribute('data-menue-aktiv', menueAktiv);
        menueSeiteHover(false);
        hamburger.style.marginRight = '';
        document.body.style.paddingRight = '';
        document.body.style.top = '';
        window.scrollTo(0, y);
        // projekt.js
        if (nebeninformationDesktop) {
            nebeninformationDesktop.style.position = 'sticky';
        }
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
document.getElementById('hamburger').addEventListener('click', event => {
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