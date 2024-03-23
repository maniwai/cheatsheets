// Define an interface for the prototype
interface Prototype {
  clone(): Prototype;
  getName(): string;
}

// Concrete implementation of the prototype
class ConcretePrototype implements Prototype {
  private name: string;

  constructor(name: string) {
    this.name = name;
  }

  clone(): Prototype {
    return new ConcretePrototype(this.name);
  }

  getName(): string {
    return this.name;
  }
}

// Prototype registry
class PrototypeRegistry {
  private prototypes: { [key: string]: Prototype } = {};

  register(name: string, prototype: Prototype): void {
    this.prototypes[name] = prototype;
  }

  createInstance(name: string): Prototype | null {
    const prototype = this.prototypes[name];
    return prototype ? prototype.clone() : null;
  }
}

// Client code
const registry = new PrototypeRegistry();

// Create and register prototype instances
const prototypeA = new ConcretePrototype("Prototype A");
const prototypeB = new ConcretePrototype("Prototype B");

registry.register("A", prototypeA);
registry.register("B", prototypeB);

// Clone prototype instances
const instanceA = registry.createInstance("A");
const instanceB = registry.createInstance("B");

// Output
console.log(instanceA?.getName()); // Output: Prototype A
console.log(instanceB?.getName()); // Output: Prototype B
