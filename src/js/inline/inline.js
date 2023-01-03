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
	return function() {
		var context = this, args = arguments;
		var later = function() {
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
var emlArray = document.getElementsByClassName("eml");
for(var i = (emlArray.length - 1); i >= 0; i--) {
    var obj = emlArray[i];
    var eml = obj.getAttribute('data-eml');
    var emlText = eml+'@domain.tld';
    var emlAddress = 'mailto:'+emlText;
    obj.setAttribute('href', emlAddress);
    obj.innerHTML = emlText;
}