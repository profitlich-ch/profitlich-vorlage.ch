$(document).ready(function () {

    $('body').prepend('<div class="dev" id="dev"></div>');
    var dev = $('#dev');

    var down = {};
    $(document).keydown(function(e) {
        down[e.keyCode] = true;
    }).keyup(function(e) {
        // 224 Command
        // 16 Shift
        // 17 Ctrl links
        // 68 D
        if (down[17]) {
            $('body').attr('data-dev') == 'false' ? $('body').attr('data-dev', 'true') : $('body').attr('data-dev', 'false');
        }
        down[e.keyCode] = false;
    });

    var body = document.body;

    var observer = new MutationObserver(function(mutations) {
        dev.text( $('body').attr('data-layout') );
    });
    observer.observe(body, { 
    attributes: true, 
    attributeFilter: ['data-layout'] });

});