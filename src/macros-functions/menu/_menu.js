class MenuToggle {
  constructor(hamburger, menu) {
    this.hamburger = hamburger;
    this.menu = menu;
    this.isActive = false;

    // ddd event listener to hamburger
    this.hamburger.addEventListener('click', this.togglemenu.bind(this));

    // add event listener to menu items
    this.menu.querySelectorAll('.menu__link').forEach(link => {
      link.addEventListener('click', () => {
        this.togglemenu();
      });
    });
  }

  togglemenu() {
      if (this.isActive) {
        this.isActive = false;
        document.body.removeEventListener('click', this.onBodyClick.bind(this));
        document.body.setAttribute('data-menu-active', this.isActive);
        this.hamburger.style.marginRight = '';
        document.body.style.paddingRight = '';
        document.body.style.top = '';
        window.scrollTo(0, this.y);
      } else {
        this.isActive = true;
        document.body.addEventListener('click', this.onBodyClick.bind(this));
        this.scrollbar = window.innerWidth - document.documentElement.clientWidth;
        this.y = window.scrollY;
        document.body.setAttribute('data-menu-active', this.isActive);
        const marginOriginal = parseFloat(window.getComputedStyle(this.hamburger).marginRight);
        this.hamburger.style.marginRight = `${marginOriginal + this.scrollbar}px`;
        document.body.style.paddingRight = `${this.scrollbar}px`;
        document.body.style.top = `-${this.y}px`;
      }
    }

  onBodyClick(event) {
    if (!event.target.closest('.header') && !event.target.closest('.menu__hamburger')) {
      this.togglemenu();
    }
  }

  onmenuItemClick(event) {
    const target = event.target;
    if (target.matches('.menu__link')) {
      this.togglemenu();
    }
  }
}

const menuToggle = new MenuToggle(document.getElementById('hamburger'), document.getElementById('menu'));
