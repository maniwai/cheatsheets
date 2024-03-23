import { Bar } from "./BAR";
import { IFoo } from "./IFOO";

export class Foo {
  bar: Bar = new Bar();

  foo() {
    this.bar.foo();
  }
}
