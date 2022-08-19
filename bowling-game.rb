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
        if pins[index - 2] == "X"
          first_score = spares.pop
          spares.pop
          spares << 20
          spares << first_score
        end
        if pins[index + 1] == "X"
          spares << (10 - pins[index - 1]) + 10
        else
          spares << (10 - pins[index - 1]) + pins[index + 1]
        end
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
        if pins[index + 1] == "X"
          strikes << 20
          if pins[index + 2] != "X"
            strikes << pins[index + 2]
          end
        else
          strikes << 10 + pins[index + 1] + pins[index + 2]
        end
      else
        strikes << pins[index]
      end
      index += 1
    end
    strikes
  end
end
