// Kartenstil
var kartenstil = [
    {
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ebe8e1"
            }
        ]
    },
    {
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "weight": 0.5
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#dfdbcf"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#757575"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ebe8e1"
            },
            {
                "weight": 1
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#bfb79f"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#bfb79f"
            },
            {
                "weight": 0.5
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "weight": 0.5
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "color": "#bed1dc"
            }
        ]
    }
];


// Google Maps
var map;
karteInitialisiert = false;

function karteInitialisieren(karte) {

    if (karteInitialisiert == false) {
        var script = document.createElement('script');
        script.src = 'https://maps.googleapis.com/maps/api/js?key=APIKEY&callback=initMap';
        script.async = true;
    
        // Attach your callback function to the `window` object
        window.initMap = function() {
            karteInitialisiert = true;
            markerInitialisieren();
            karteAnzeigen(karte);
        };
    
        // Append the 'script' element to 'head'
        document.head.appendChild(script);
    } else {
        karteAnzeigen(karte);
    }
    
    function karteAnzeigen(karte) {

        var styledMap = new google.maps.StyledMapType(kartenstil, { name: "Reduziert" });

        mapObject = new google.maps.Map(karte, {
            center: { lat: 47.0368931, lng: 8.3066952 },
            zoom: 14,
            mapTypeControl: false,
            streetViewControl: false,
        });
        mapObject.mapTypes.set('map_style', styledMap);
        mapObject.setMapTypeId('map_style');

        markerSetzen(karte);

    }
}

function markerInitialisieren() {
    // Marker definieren
    markerBild = {

        path: 'M55.32,0H55A54.84,54.84,0,0,0,0,54.68V55C0,85.5,55,160,55,160s55-74.5,55-105A54.84,54.84,0,0,0,55.32,0Zm.17,80H55a24.76,24.76,0,1,1,.49,0Z',
        fillColor: '#000000',
        fillOpacity: 1,
        scale: 0.4,
        strokeWeight: 0,
        scaledSize: new google.maps.Size(110, 160),
        origin: new google.maps.Point(55, 160),
        anchor: new google.maps.Point(55, 160),

    };
}


// Marker setzen
function markerSetzen(karte) {

    if (typeof markierung !== 'undefined') {
        while (markierung.length) {
            markierung.pop().setMap(null);
        }
    }

    // Marker Variablen setzen
    markierung = [];
    latlngbounds = '';
    latlngbounds = new google.maps.LatLngBounds();
    var marker = karte.getAttribute('data-karte-marker');
    var markerArray = JSON.parse(marker);
    var zoom = parseInt(karte.getAttribute('data-karte-zoom'));
    markerArray.forEach(marker => {
        var myLatlng = new google.maps.LatLng(marker.lat, marker.lng);
        markierung[i] = new google.maps.Marker({
            position: myLatlng,
            map: mapObject,
            icon: markerBild
        });
        latlngbounds.extend(myLatlng);
    });
    mapObject.fitBounds(latlngbounds);
    var listener = google.maps.event.addListener(mapObject, "idle", function () {
        if (mapObject.getZoom() > zoom) mapObject.setZoom(zoom);
        google.maps.event.removeListener(listener);
    });
}

document.querySelectorAll('[data-karte]').forEach(karte => {
    karteInitialisieren(karte);
});