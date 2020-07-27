object Say {
  val min = 0
  val max = 999999999999l

  val dict = Map(
    0l -> "zero",
    1l -> "one",
    2l -> "two",
    3l -> "three",
    4l -> "four",
    5l -> "five",
    6l -> "six",
    7l -> "seven",
    8l -> "eight",
    9l -> "nine",
    10l -> "ten",
    11l -> "eleven",
    12l -> "twelve",
    13l -> "thirteen",
    14l -> "fourteen",
    15l -> "fifteen",
    16l -> "sixteen",
    17l -> "seventeen",
    18l -> "eighteen",
    19l -> "nineteen",
    20l -> "twenty",
    30l -> "thirty",
    40l -> "forty",
    50l -> "fifty",
    60l -> "sixty",
    70l -> "seventy",
    80l -> "eighty",
    90l -> "ninety",
    100l -> "one hundred"
  )
  val magnitudeOrders = List("", "thousand", "million", "billion")

  def toList(s: String): List[String] = {
    if (s.length <= 3) return List(s)
    else {
      val remaining = s.dropRight(3)
      val off = s.takeRight(3)

      return toList(remaining) ++ List(off)
    }
  }

  def segmentToString(num: String): String = {
    val numex = raw"(\d?)(\d?)(\d?)".r

    num match {
      case numex(ones, "", "") => dict.get(ones.toInt).getOrElse("")
      case numex(tenths, ones, "") => dict.get(tenths.toInt * 10).getOrElse("s")+"-"+dict.get(ones.toInt).getOrElse("")
      case numex("0", "0", ones) => dict.get(ones.toInt).getOrElse("")
      case numex("0", tenths, ones) => dict.get(tenths.toInt * 10).getOrElse("s")+"-"+dict.get(ones.toInt).getOrElse("")
      case numex(hundreds, tenths, ones) => dict.get(hundreds.toInt).getOrElse("") + " hundred " + dict.get(tenths.toInt * 10).getOrElse("")+"-"+dict.get(ones.toInt).getOrElse("")
      case _ => ""
    }
  }

  def inEnglish(num: Long): Option[String] = {
    if (num < min || num > max) {
      None
    } else {
      if (dict.contains(num)) return dict.get(num)
      else {
        val asList = toList(num.toString).reverse.zip(magnitudeOrders)
        Some(asList.foldRight("")((curr, acc) => {
          val toStr = segmentToString(curr._1)
          if (toStr.contains("zero")) acc
          else  acc + toStr + " " + curr._2 + " "
        }).trim)
      }
    }
  }
}