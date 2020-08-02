import scala.math.{random, round}

class Robot {
  val alphabet = 'a' to 'z'

  def randLetter() = {
    alphabet(round((random() * alphabet.length)).toInt)
  }

  def randNum() = {
    random()*999.toInt
  }

  def reset() = {
    name = s"$randLetter$randLetter$randNum"
  }

  var name = s"$randLetter$randLetter$randNum"
}
