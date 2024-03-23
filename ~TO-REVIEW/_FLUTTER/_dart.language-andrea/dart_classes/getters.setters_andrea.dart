class Temperature {
  Temperature.celsius(this.celsius);
  Temperature.farenheit(double farenheit) : celsius = (farenheit - 32) / 1.8;

  double celsius;
  // getters & setters
  double get farenheit => celsius * 1.8 + 32;
  set farenheit(double farenheit) => celsius = (farenheit - 32) / 1.8;
}
void main() {
  final temperature = Temperature.celsius(30);
  print(temperature.celsius);
  temperature.celsius = 32;
  print(temperature.farenheit);
  temperature.farenheit = 90;
  print(temperature.farenheit);
}