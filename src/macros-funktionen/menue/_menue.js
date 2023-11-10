class MenuToggle {
  constructor(hamburger, menue) {
    this.hamburger = hamburger;
    this.menue = menue;
    this.isActive = false;

    // Add event listener zum hamburger
    this.hamburger.addEventListener('click', this.toggleMenue.bind(this));

    // Add event listener zum menue items
    this.menue.querySelectorAll('.menue__link').forEach(link => {
      link.addEventListener('click', () => {
        this.toggleMenue();
      });
    });
  }

  toggleMenue() {
      if (this.isActive) {
        this.isActive = false;
        document.body.removeEventListener('click', this.onBodyClick.bind(this));
        document.body.setAttribute('data-menue-aktiv', this.isActive);
        this.hamburger.style.marginRight = '';
        document.body.style.paddingRight = '';
        document.body.style.top = '';
        window.scrollTo(0, this.y);
      } else {
        this.isActive = true;
        document.body.addEventListener('click', this.onBodyClick.bind(this));
        this.scrollbar = window.innerWidth - document.documentElement.clientWidth;
        this.y = window.scrollY;
        document.body.setAttribute('data-menue-aktiv', this.isActive);
        const marginOriginal = parseFloat(window.getComputedStyle(this.hamburger).marginRight);
        this.hamburger.style.marginRight = `${marginOriginal + this.scrollbar}px`;
        document.body.style.paddingRight = `${this.scrollbar}px`;
        document.body.style.top = `-${this.y}px`;
      }
    }

  onBodyClick(event) {
    if (!event.target.closest('.header') && !event.target.closest('.menue__hamburger')) {
      this.toggleMenue();
    }
  }

  onMenueItemClick(event) {
    const target = event.target;
    if (target.matches('.menue__link')) {
      this.toggleMenue();
    }
  }
}

const menuToggle = new MenuToggle(document.getElementById('hamburger'), document.getElementById('menue'));
