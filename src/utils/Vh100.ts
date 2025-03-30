
/** 
 * 100vh problem
 * https://css-tricks.com/the-trick-to-viewport-units-on-mobile/
 */

export class Vh100 {
    private vh: number;
    
    constructor() {
        this.vh = 0;
        this.init();
    }
    
    private init() {
        this.calculate();
        // We listen to the resize event
        window.addEventListener('resize', () => {
            this.calculate();
        });
    }

    private calculate() {
        // First we get the viewport height and we multiple it by 1% to get a value for a vh unit
        let vh = window.innerHeight * 0.01;
        // Then we set the value in the --vh custom property to the root of the document
        document.documentElement.style.setProperty('--vh', `${vh}px`);
    }
}