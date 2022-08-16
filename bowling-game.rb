class BowlingGame
  def my_test_method
    return true
  end

  def score(pins)
    score = pins.nozeros
    score.reduce(0) { |sum, x| sum + x }
  end

  def nozeros
    nozeros = []
    pins.each do |x|
      if x == "-"
        nozeros << 0
      else
        nozeros << x
      end
    end
    return nozeros
  end
end
