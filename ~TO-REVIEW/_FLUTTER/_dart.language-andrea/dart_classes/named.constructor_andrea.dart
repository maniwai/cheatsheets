class Complex {
  final double re;
  final double im;

  const  Complex(this.re, this.im);
  // we use named constructor to have different initialization
  const Complex.identity() : re = 1, im = 0;
  const Complex.real(this.re) : im = 0;
  const Complex.imaginary(this.im) : re = 0;
}
void main() {
  final identity = Complex.identity();
  final real = Complex.real(3);
  final imaginary = Complex.imaginary(4);
}