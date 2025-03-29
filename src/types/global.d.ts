export {};

declare global {
    interface WindowEventMap {
        'eventLayoutchange': CustomEvent;
        'setScrolled': CustomEvent;
    }
}