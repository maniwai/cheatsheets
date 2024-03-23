/**
 * WITHOUT BRIDGE
 * ------------------------------------------------
 * THe problem is we need to keep extending as it grows
 * ie: adding a GreenSquare, or adding a Rectangle shape
 */
abstract class Shape1 {
  public abstract applyColor(): void;
}
abstract class Circle extends Shape1 {}
abstract class Square1 extends Shape1 {}
class BlueCircle extends Circle {
  public applyColor(): void {
    console.log("Applying blue color");
  }
}
class RedSquare extends Square1 {
  public applyColor(): void {
    console.log("Applying red color");
  }
}
// Client Code
// let circle = new BlueCircle();
// let square1 = new RedSquare();
// circle.applyColor();
// square1.applyColor();

/**
 * WITH BRIDGE
 * ------------------------------------------------
 * now we are idealizing 'Composition'
 * we can add new color independently from Shape (and vise versa)
 */
interface Color {
  apply(): void;
}
class Blue implements Color {
  apply(): void {
    console.log("Applying blue color");
  }
}
abstract class Shape2 {
  protected color: Color;
  public constructor(color: Color) {
    this.color = color;
  }
  public abstract applyColor(): void;
}
class Square2 extends Shape2 {
  public constructor(color: Color) {
    super(color);
  }
  public applyColor(): void {
    this.color.apply();
  }
}
const blue = new Blue();
const square2 = new Square2(blue);
square2.applyColor();
