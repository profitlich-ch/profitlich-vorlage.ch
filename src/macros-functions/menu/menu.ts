export class MenuToggle {
    private hamburger: HTMLElement;
    private menu: HTMLElement;
    private isActive: boolean;
    private y: number;

    constructor(hamburger: HTMLElement, menu: HTMLElement) {
        this.hamburger = hamburger;
        this.menu = menu;
        this.isActive = false;
        this.y = 0;

        // Add click listener to hamburger
        this.hamburger.addEventListener('click', () => {
            this.togglemenu();
        });

        // Add event listener to menu items
        this.menu.querySelectorAll('.menu__link').forEach(link => {
            link.addEventListener('click', () => {
                this.togglemenu();
            });
        });
    }

    togglemenu() {
        if (this.isActive) {
            this.isActive = false;
            document.body.setAttribute('data-menu-active', this.isActive ? 'true' : 'false');
            this.hamburger.style.marginRight = '';
            document.body.style.paddingRight = '';
            document.body.style.top = '';
            window.scrollTo(0, this.y);
        } else {
            this.isActive = true;
            let scrollbar = window.innerWidth - document.documentElement.clientWidth;
            let y = window.scrollY;
            document.body.setAttribute('data-menu-active', this.isActive ? 'true' : 'false');
            const marginOriginal = parseFloat(window.getComputedStyle(this.hamburger).marginRight);
            this.hamburger.style.marginRight = `${marginOriginal + scrollbar}px`;
            document.body.style.paddingRight = `${scrollbar}px`;
            document.body.style.top = `-${this.y}px`;
        }
    }
}