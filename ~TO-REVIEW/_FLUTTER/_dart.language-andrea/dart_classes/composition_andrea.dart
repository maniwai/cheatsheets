// inheritance "is-a" relationship (a Square "is a" Shape)
// composition "has-a" relationship (a Stack "has a" List)
void main() {
  final button = Button(
    // we can pass any object inheriting Widget as argument because of composition
    aWidget: Text('Hello'),
  );
}

abstract class Widget {}

class Text extends Widget {
  Text(this.text);
  final String text;
}

class Button extends Widget {
  Button({required this.aWidget});
  // we are using composition by using the "buttonWidget" object.
  final Widget aWidget;
}
