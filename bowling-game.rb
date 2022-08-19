class BowlingGame
  def my_test_method
    return true
  end

  def score(pins)
    score = nozeros(pins)
    score = spares(score)
    score = strikes(score)
    score.reduce(0) { |total, score| total + score }
  end

  def nozeros(pins)
    nozeros = pins.map do |score|
      if score == "-"
        score = 0
      else
        score = score
      end
    end
    nozeros
  end

  def spares(pins)
    index = 0
    spares = []
    while index < pins.length
      if pins[index] == "/"
        spares << (10 - pins[index - 1]) + pins[index + 1]
      else
        spares << pins[index]
      end
      index += 1
    end
    spares
  end

  def strikes(pins)
    index = 0
    strikes = []
    while index < pins.length
      if pins[index] == "X"
        strikes << 10 + pins[index + 1] + pins[index + 2]
      else
        strikes << pins[index]
      end
      index += 1
    end
    strikes
  end
end
