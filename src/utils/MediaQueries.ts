// Media queries
// https://kinsta.com/blog/javamediaqueryipt-media-query/
// option 3 on the linked page

import config from '../config.json' with { type: "json" };

export class MediaQueries {
    private layout: keyof typeof config.layouts = 'desktop';

    constructor() {
        this.layout = 'desktop';
        this.changeLayout();
        this.matchmedia();
    }

    get currentLayout() {
        return this.layout;
    }

    private matchmedia() {
        for (let [layout, minSize] of Object.entries(config.breakpoints)) {
            if (minSize) {
                var matchmedia = window.matchMedia('(min-width: ' + minSize + 'px)');
                matchmedia.addEventListener('change', (e) => this.changeLayout());
            }
        }
    }
    
    // media query handler function
    changeLayout() {
        // let size = null;
        for (let [layout, minSize] of Object.entries(config.breakpoints)) {
            var matchmedia = window.matchMedia('(min-width: ' + minSize + 'px)');
            if (!matchmedia || matchmedia.matches) {
                this.layout = layout as keyof typeof config.layouts;
            }
        }
        document.body.setAttribute('data-layout', this.layout);
    
        // create event
        let event = new CustomEvent('eventLayoutchange', {
            detail: {
                layout: this.layout
            }
        });
        // dispatch the event
        window.dispatchEvent(event);
    }
}