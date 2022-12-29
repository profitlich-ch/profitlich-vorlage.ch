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