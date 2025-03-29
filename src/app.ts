import 'lazysizes';
import { mediaQueries } from './utils/media-queries.ts';
import { bodyScrolled } from './utils/body-scrolled.ts';
import { MenuToggle } from './macros-functions/menu/menu.ts';

class App {
    public mediaQuery: mediaQueries;
    public bodyScrolledEvent: bodyScrolled;
    public menuToggle: MenuToggle;

    constructor() {
        this.mediaQuery = new mediaQueries();
        this.bodyScrolledEvent = new bodyScrolled();
        
        const hamburger = document.getElementById('hamburger') as HTMLElement;
        const menu = document.getElementById('menu') as HTMLElement;
        this.menuToggle = new MenuToggle(hamburger, menu);

        this.initialize();
    }

    private initialize() {
        console.log('App initialized');
    }
}

export const app = new App();