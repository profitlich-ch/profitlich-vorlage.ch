class StickyMenu {
    constructor() {
      this.menuActive = false;
      this.page = document.getElementById('seite');
      this.hamburger = document.getElementById('hamburger');
      this.stickyElements = [];
      this.stickyElementsArray = [];
      this.y = 0;
  
      this.init();
    }
  
    init() {
      this.stickyElementsFind();
      this.hamburger.addEventListener('click', event => {
        event.preventDefault();
        event.stopPropagation();
        this.toggleMenu();
      });
  
      const menu = document.getElementById('menue__menue');
      menu.addEventListener('click', event => {
        if (this.menuActive) {
          const { target } = event;
          if (target.matches('.menue__link')) {
            this.toggleMenu();
          }
        }
      });
    }
  
    stickyElementsFind() {
      const stickyElementsAll = document.querySelectorAll('[data-sticky]');
      Array.from(stickyElementsAll).forEach(element => {
        if (window.getComputedStyle(element).position === 'sticky') {
          this.stickyElements.push(element);
        }
      });
    }
  
    toggleMenu() {
      if (!this.menuActive) {
        if (this.stickyElements.length > 0) {
          this.stickyElements.forEach((stickyElement, index) => {
            const stickyElementStyles = window.getComputedStyle(stickyElement);
            this.stickyElementsArray[index] = {
              top: stickyElementStyles.top,
              width: stickyElementStyles.width
            };
  
            const stickyElementTop = stickyElement.getBoundingClientRect().top;
            const stickyElementWidth = stickyElement.getBoundingClientRect().width;
            stickyElement.style.top = stickyElementTop + 'px';
            stickyElement.style.width = stickyElementWidth + 'px';
            stickyElement.style.position = 'fixed';
          });
        }
  
        this.menuActive = true;
        document.body.addEventListener('click', this.handleBodyClick.bind(this));
        this.page.addEventListener('mouseenter', this.handlePageHover.bind(this));
        this.page.addEventListener('mouseleave', this.handlePageHover.bind(this));
  
        const scrollbar = window.innerWidth - document.documentElement.clientWidth;
        this.y = window.scrollY;
        document.body.setAttribute('data-menue-aktiv', this.menuActive);
        const marginOriginal = parseFloat(window.getComputedStyle(this.hamburger).marginRight);
        this.hamburger.style.marginRight = marginOriginal + scrollbar + 'px';
        document.body.style.paddingRight = scrollbar + 'px';
        document.body.style.top = -this.y + 'px';
      } else {
        if (this.stickyElements.length > 0) {
          this.stickyElements.forEach((stickyElement, index) => {
            stickyElement.style.top = this.stickyElementsArray[index].top;
            stickyElement.style.position = 'sticky';
          });
        }
  
        this.menuActive = false;
        document.body.removeEventListener('click', this.handleBodyClick.bind(this));
        this.page.removeEventListener('mouseenter', this.handlePageHover.bind(this));
        this.page.removeEventListener('mouseleave', this.handlePageHover.bind(this));
        document.body.setAttribute('data-menue-aktiv', this.menuActive);
        this.handlePageHover(false);
        this.hamburger.style.marginRight = '';
        document.body.style.paddingRight = '';
        document.body.style.top = '';
        window.scrollTo(0, this.y);
      }
    }
  
    handleBodyClick(event) {
      if (this.menuActive && !event.target.closest('.menue__menue')) {
        this.toggleMenu();
      }
    }
  
    handlePageHover(event) {
      if (event && event.type === 'mouseenter') {
        document.body.setAttribute('data-seite-hover', 'true');
      } else {
        document.body.setAttribute('data-seite-hover', 'false');
      }
    }
  }
  
  new StickyMenu();
  