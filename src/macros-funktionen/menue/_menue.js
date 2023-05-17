class Menue {
    constructor() {
      this.menueAktiv = false;
      this.hamburger = document.getElementById('hamburger');
      this.y = 0;
  
      this.initialize();
    }
  
    initialize() {
      this.hamburger.addEventListener('click', this.menueToggle.bind(this));
      document.body.addEventListener('click', this.menueBodyClick.bind(this));
    }
  
    menueToggle(event) {
      event.preventDefault();
      event.stopPropagation();
  
      if (!this.menueAktiv) {
        this.menueAktiv = true;
        document.body.addEventListener('click', this.menueBodyClick.bind(this));
        const scrollbar = window.innerWidth - document.documentElement.clientWidth;
        this.y = window.scrollY;
        document.body.setAttribute('data-menue-aktiv', this.menueAktiv);
        const marginOriginal = parseFloat(window.getComputedStyle(this.hamburger).marginRight);
        // Weitere Aktionen für menueAktiv == true
      } else {
        this.menueAktiv = false;
        document.body.removeEventListener('click', this.menueBodyClick.bind(this));
        document.body.setAttribute('data-menue-aktiv', this.menueAktiv);
        this.hamburger.style.marginRight = '';
        document.body.style.paddingRight = '';
        document.body.style.top = '';
        window.scrollTo(0, this.y);
      }
    }
  
    menueBodyClick(event) {
      if (this.menueAktiv) {
        if (!event.target.closest('.menue')) {
          this.menueToggle(event);
        }
      }
    }
  }
  
  const menue = new Menue();
  
