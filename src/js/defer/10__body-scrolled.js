// Body Attribute scrolled = true geben, wenn gescrollt wurde
document.addEventListener('scroll', function gescrollt() {
    document.body.setAttribute('data-body-scrolled', 'true');
    this.removeEventListener('scroll', gescrollt);
});