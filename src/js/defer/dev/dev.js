const devDiv = document.createElement('div');
    devDiv.classList.add('dev');
    devDiv.setAttribute('id', 'dev');
document.body.prepend(devDiv);
const body = document.body;

body.setAttribute('data-dev', 'true');

var down = {};
document.addEventListener('keydown', (event) => {
    // 224 Command
    // 16 Shift
    // 17 Ctrl links
    // 68 D
    if (event.key = 17) {
        var devStatus = body.getAttribute('data-dev') == 'false' ? 'true' : 'false';
        document.body.setAttribute('data-dev', devStatus);
    }
});

var observer = new MutationObserver(function(mutations) {
    dev();
});
observer.observe(body, { 
    attributes: true, 
    attributeFilter: ['data-layout']
});

window.onresize = dev;

function dev() {
    windowHeight = window.innerHeight;
    windowWidth = window.innerWidth;
    devDiv.textContent = document.body.getAttribute('data-layout') + ' @ ' + windowWidth + '×' + windowHeight;
}
dev();