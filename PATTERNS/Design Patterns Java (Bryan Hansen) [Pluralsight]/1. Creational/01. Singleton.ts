export class Singleton {
    private static instance: Singleton;

    private constructor() {
        console.log('instanciated only once!');
    }
    public static getInstance(): Singleton {
        if (!Singleton.instance) {
            Singleton.instance = new Singleton();
        }
        return Singleton.instance;
    }
}
