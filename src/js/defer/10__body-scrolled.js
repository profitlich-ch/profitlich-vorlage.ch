// after scroll set body attribute data-scrolled to true
document.addEventListener('scroll', function setScrolled() {
    document.body.setAttribute('data-body-scrolled', 'true');
    this.removeEventListener('scroll', setScrolled);
});