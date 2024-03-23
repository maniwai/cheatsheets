import { IFoo } from "./IFOO";

export class Bar implements IFoo {
  public foo() {
    console.log("bar");
  }
}
