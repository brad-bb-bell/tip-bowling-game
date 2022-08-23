class BowlingGame
  def my_test_method
    return true
  end

  def score(pins)
    score = no_zeros(pins)
    score = check_extra_frames(score)
    score = spares(score)
    score = strikes(score)
    score.reduce(0) { |total, score| total + score }
  end

  def no_zeros(pins)
    no_zeros = pins.map do |score|
      if score == "-"
        score = 0
      else
        score = score
      end
    end
    no_zeros
  end

  def check_extra_frames(pins)
    index = 0
    @frames = 0
    while index < pins.length
      if pins[index] == "X"
        @frames += 2
      else
        @frames += 1
      end
      index += 1
    end
    if pins[-3] == "X" && pins[-2] != "X" && pins[-1] != "X"
      @deduction = pins[-1] + pins[-2]
    end
    if pins[-3] == "X" && pins[-2] == "X" && pins[-1] == "X"
      @addition = 60
      pins.delete_at(-1)
      pins.delete_at(-2)
    end
    pins
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
        if pins[index + 1] == "X" && pins[index + 2] == "X"
          strikes << 30
        elsif pins[index + 1] == "X" && pins[index + 2] != "X" && !@addition
          strikes << 20
          strikes << pins[index + 2]
        elsif !@addition && pins[index + 2]
          strikes << 10 + pins[index + 1] + pins[index + 2]
        end
      else
        if @frames <= 20
          strikes << pins[index]
        elsif @deduction
          strikes << pins[index]
        end
      end
      index += 1
    end
    if @deduction && @frames > 20
      return strikes << 0 - @deduction
    end
    if @addition
      return strikes << @addition
    end
    strikes
  end
end
