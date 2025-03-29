import 'lazysizes';
import { MediaQueries } from './utils/MediaQueries.ts';
import { BodyScrolled } from './utils/BodyScrolled.ts';
import { MenuToggle } from './macros-functions/menu/menu.ts';

class App {
    public mediaQuery: MediaQueries;
    public bodyScrolledEvent: BodyScrolled;
    public menuToggle: MenuToggle;

    constructor() {
        this.mediaQuery = new MediaQueries();
        this.bodyScrolledEvent = new BodyScrolled();
        
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