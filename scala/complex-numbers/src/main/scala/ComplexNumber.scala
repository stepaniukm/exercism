object ComplexNumber {
  def apply(real: Double = 0, imaginary: Double = 0) = {
    new ComplexNumber(real, imaginary)
  }

  def exp(c: ComplexNumber): ComplexNumber = {
    new ComplexNumber(math.pow(math.E, c.real) * math.cos(c.imaginary), math.pow(math.E, c.real) * math.sin(c.imaginary))
  }
}

class ComplexNumber(var real: Double, var imaginary: Double) {
  def +(c2: ComplexNumber): ComplexNumber = {
    new ComplexNumber(real + c2.real, imaginary + c2.imaginary)
  }

  def -(c2: ComplexNumber): ComplexNumber = {
    new ComplexNumber(real - c2.real, imaginary - c2.imaginary)
  }

  lazy val abs = math.sqrt(math.pow(real, 2) + math.pow(imaginary,2))

  def *(c2: ComplexNumber): ComplexNumber = {
    new ComplexNumber(real * c2.real - imaginary*c2.imaginary, imaginary * c2.real + real * c2.imaginary)
  }

  def /(c2: ComplexNumber): ComplexNumber = {
    val r = (real * c2.real + imaginary * c2.imaginary)/(math.pow(c2.real,2) + math.pow(c2.imaginary,2))
    val i = (imaginary * c2.real - real * c2.imaginary)/(math.pow(c2.real,2) + math.pow(c2.imaginary,2))
    new ComplexNumber(r, i)
  }

  def conjugate(): ComplexNumber = {
    new ComplexNumber(real, -imaginary)
  }
}