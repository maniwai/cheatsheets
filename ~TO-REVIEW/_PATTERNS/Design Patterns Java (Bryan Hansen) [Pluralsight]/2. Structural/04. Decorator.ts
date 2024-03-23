interface Sandwich {
    make(): string;
}

class SimpleSandwich implements Sandwich {
    make(): string {
        return 'Simple Sandwich';
    }
}

abstract class SandwichDecorator implements Sandwich {
    protected customSandwich: Sandwich;

    public constructor(customSandwich: Sandwich) {
        this.customSandwich = customSandwich;
    }

    public make(): string {
        return this.customSandwich.make();
    }
}

class MeatDecorator extends SandwichDecorator {
    public constructor(customSandwich: Sandwich) {
        super(customSandwich);
    }

    public make(): string {
        return this.customSandwich.make() + this.addMeat();
    }
    private addMeat(): string {
        return ' + turkey';
    }
}
class DressingDecorator extends SandwichDecorator {
    public constructor(customSandwich: Sandwich) {
        super(customSandwich);
    }

    public make(): string {
        return this.customSandwich.make() + this.addDressing();
    }
    private addDressing(): string {
        return ' + mustard';
    }
}

// Client Code
let sandwich = new DressingDecorator(new MeatDecorator(new SimpleSandwich()));
console.log(sandwich.make());
let sandwich2 = new MeatDecorator(new DressingDecorator(new SimpleSandwich()));
console.log(sandwich2.make());
