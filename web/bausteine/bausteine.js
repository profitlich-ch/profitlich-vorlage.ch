$(document).ready(function() {
    
    // bausteineQuery = window.location.search.substring(1);
    bausteineDarstellung = $('#bausteine__darstellung');
    bausteinZwischenspeicher = $('#bausteine__liste__zwischenspeicher');

    const urlParams = new URLSearchParams(window.location.search);
    const rasterQuery = urlParams.get('raster');
    const bausteineQuery = urlParams.get('bausteine');
    const hintergrundQuery = urlParams.get('hintergrund');

    var hintergrund = (hintergrundQuery == null || hintergrundQuery != 'story-atelier') ? 'raeume-der-kraft' : 'story-atelier';
    var raster = (rasterQuery == null || rasterQuery != 'an') ? 'aus' : 'an';


    // Slideout Menü
    var slideout = new Slideout({
        'panel': document.getElementById('bausteine__darstellung-container'),
        'menu': document.getElementById('bausteine__liste'),
        'padding': 300,
        'tolerance': 70
    });

    var down = {};
    $(document).keydown(function(e) {
        down[e.keyCode] = true;
    }).keyup(function(e) {
        // Tasten Ctrl M
        if (down[18] && down[77]) {
            slideout.toggle();
        }
        down[e.keyCode] = false;
    });



    function rasterSchalten() {
        if (raster == 'an') {
            $('body').addClass('dev');
        } else {
            $('body').removeClass('dev');
        }
    }
    
    function hintergrundSchalten() {
        if (hintergrund == 'story-atelier') {
            bausteineDarstellung.removeClass('bausteine__darstellung--raeume-der-kraft').addClass('bausteine__darstellung--story-atelier');
        } else {
            bausteineDarstellung.addClass('bausteine__darstellung--raeume-der-kraft').removeClass('bausteine__darstellung--story-atelier');
        }
    }

    function urlAktualisieren() {

        bausteine = [];
                    
        $('#bausteine__darstellung .bausteine__darstellung__baustein').each(function() {
            bausteine.push( $(this).data('baustein') );
        });
        
        history.replaceState( null, null, "?bausteine=" + bausteine.join(',') + '&hintergrund=' + hintergrund + '&raster=' + raster );
    }

    rasterSchalten();
    hintergrundSchalten();


    function getBausteinXML(baustein) {

        urlXSL = '/workspace/bausteine/' + baustein + '/' + baustein + '.xsl';
        urlXML = '/workspace/mockup/bausteine/' + baustein + '/' + baustein + '.xml';

        var xslStylesheet;
        var xsltProcessor = new XSLTProcessor();
        var xmlDoc;                    
        
        xsltProcessor.setParameter(null, "workspace", "/workspace");
        
        // XSL Datei laden
        var xhr = new XMLHttpRequest();
        xhr.open('GET', urlXSL, false);
        xhr.send(null);
        xslStylesheet = xhr.responseXML;
        
        // xsltProcessor.setStartMode("anreisser");
        xsltProcessor.importStylesheet(xslStylesheet);
        
        // XML Datei laden
        xhr = new XMLHttpRequest();
        xhr.open('GET', urlXML, false);
        xhr.send(null);
        xmlDoc = xhr.responseXML;
        
        var htmlDocument = xsltProcessor.transformToDocument(xmlDoc, document);

        bausteinEinfuegen(htmlDocument.documentElement.outerHTML, baustein);

    }


    function getBausteinHTML(baustein, queryAktualisieren) {

        urlHTML = '/workspace/bausteine/' + baustein + '/' + baustein + '.html';

        $.ajax({
            type: 'GET',
            url: urlHTML,
            async: true,
            success: function(htmlDocument) {
                bausteinEinfuegen(htmlDocument, baustein, queryAktualisieren);
            },
            error: function() {
                getBausteinXML(baustein);
            }
        });

    }


    function bausteinEinfuegen(bausteinHTML, baustein, queryAktualisieren) {

        bausteinAppend = bausteinHTML;
        bausteineDarstellung.append(bausteinAppend);
        
        if (queryAktualisieren == true) {
            urlAktualisieren();
        }

    }


    // Bausteine beim Laden der Seite laden
    if (bausteineQuery != null) {
        bausteineArray = bausteineQuery.split(',');

        $.each(bausteineArray, function(index, baustein) {

            getBausteinHTML(baustein, 'false')
        });

    }
    
    $('.bausteine__liste').on('click', '.bausteine__liste__baustein', function(element) {
        
        var baustein = $(this).data('baustein');

        if (baustein == 'alle-loeschen') {

            bausteineDarstellung.html("");
            history.replaceState( null, null, "?" );

        } else if (baustein == 'raster') {

            raster = (raster == 'aus') ? 'an' : 'aus';
            rasterSchalten();
            urlAktualisieren()

        } else if (baustein ==  'hintergrund') {

            hintergrund = (hintergrund == 'raeume-der-kraft') ? 'story-atelier' : 'raeume-der-kraft';
            hintergrundSchalten();
            urlAktualisieren()

        } else {

            getBausteinHTML(baustein, true);
            
        }

    });


    $('#bausteine__darstellung').on('hover', '.bausteine__darstellung__baustein', function(baustein) {

        baustein = $(this).attr('class');

    });



});