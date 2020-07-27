class DNA(series: String) {
  val allowed = List('G', 'C', 'A', 'T')

  def countAll(s: String): Right[String, Map[Char, Int]] = {
    Right(s.foldLeft(Map('A' -> 0, 'C' -> 0, 'G' -> 0, 'T' -> 0))((acc, curr) => {
      acc.map(r => {
        if (r._1 == curr) (r._1, r._2 + 1)
        else r
      })
    }))
  }

  lazy val nucleotideCounts = {
    val allCorrect = series.forall(c => allowed.contains(c))

    allCorrect match {
      case false => Left("Improper values in string")
      case true => countAll(series)
    }
  }
}