import 'lazysizes';
import { MediaQueries } from './utils/MediaQueries.ts';
import { Vh100 } from './utils/Vh100.ts';
import { BodyScrolled } from './utils/BodyScrolled.ts';
import { MenuToggle } from './macros-functions/menu/menu.ts';

class App {
    public mediaQuery: MediaQueries;
    public bodyScrolledEvent: BodyScrolled;
    public vh100: Vh100;
    public menuToggle: MenuToggle;

    constructor() {
        this.mediaQuery = new MediaQueries();
        this.vh100 = new Vh100();
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