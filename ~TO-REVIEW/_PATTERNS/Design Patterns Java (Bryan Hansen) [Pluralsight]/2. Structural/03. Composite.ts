// Component interface
interface Component {
  operation(): void;
}

// Leaf class (implements Component)
class Leaf implements Component {
  private name: string;

  constructor(name: string) {
    this.name = name;
  }

  operation(): void {
    console.log(`Leaf ${this.name} is performing operation.`);
  }
}

// Composite class (implements Component)
class Composite implements Component {
  private children: Component[] = [];

  add(component: Component): void {
    this.children.push(component);
  }

  remove(component: Component): void {
    const index = this.children.indexOf(component);
    if (index !== -1) {
      this.children.splice(index, 1);
    }
  }

  operation(): void {
    console.log("Composite is performing operation.");
    for (const child of this.children) {
      child.operation();
    }
  }
}

// Example usage
const leaf1 = new Leaf("A");
const leaf2 = new Leaf("B");
const leaf3 = new Leaf("C");

const composite = new Composite();
composite.add(leaf1);
composite.add(leaf2);

const nestedComposite = new Composite();
nestedComposite.add(leaf3);
composite.add(nestedComposite);

composite.operation();
