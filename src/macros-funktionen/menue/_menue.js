var menueAktiv = false;
var seite = document.getElementById('seite');
var hamburger = document.getElementById('hamburger')

// Alle Elemente finden, die tatsächlich sticky sind
var stickyElemente = [];
function stickyElementeFinden() {
    var stickyElementeAlle = document.querySelectorAll('[data-sticky]');
    if (stickyElementeAlle) {
        for (let i = 0; i < stickyElementeAlle.length; i++) {
            if (window.getComputedStyle(stickyElementeAlle[i]).position == 'sticky') {
                stickyElemente.push(stickyElementeAlle[i]);
            }
        }
    }
}
stickyElementeFinden();

var y = 0;
const stickyElementeArray = [];
function menueToggle() {
    if (menueAktiv == false) {
        if (typeof stickyElemente != 'undefined') {
            for (let i = 0; i < stickyElemente.length; i++) {
                // Bestehende top Position in Array speichern, um sie beim Deaktivieren des Menüs wiederherzustellen
                var stickyElementStyles = window.getComputedStyle(stickyElemente[i]);
                stickyElementeArray[i] = [];
                stickyElementeArray[i].top = stickyElementStyles.top;

                // Element statt sticky neu fixed positionieren
                // Dafür muss der top-Wert auf den tatsächlichen Abstand zum viewport gesetzt werden
                var stickyElementTop = stickyElemente[i].getBoundingClientRect().top;
                var stickyElementWidth = stickyElemente[i].getBoundingClientRect().width;
                stickyElemente[i].style.top = stickyElementTop + 'px';
                stickyElemente[i].style.width = stickyElementWidth + 'px';
                stickyElemente[i].style.position = 'fixed';
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
        var marginOriginal = parseFloat(window.getComputedStyle(hamburger).marginRight);
        hamburger.style.marginRight = marginOriginal + scrollbar + 'px';
        document.body.style.paddingRight = scrollbar + 'px';
        document.body.style.top = -y + 'px';
    } else {
        if (typeof stickyElemente != 'undefined') {
            for (let i = 0; i < stickyElemente.length; i++) {
                stickyElemente[i].style.top = stickyElementeArray[i].top;
                stickyElemente[i].style.position = 'sticky';
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
    }
}

function menueBodyClick(event) {
    if (menueAktiv == true) {
        if (!event.target.closest('.menue__menue')) {
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

var menue = document.getElementById('menue__menue');
menue.addEventListener('click', event => {
    if (menueAktiv == true) {
        const { target } = event;
        if (target.matches('.menue__link')) {
            menueToggle();
        }
    }
});