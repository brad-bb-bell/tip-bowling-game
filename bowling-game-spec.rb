require_relative "bowling-game"

RSpec.describe BowlingGame do
  describe "#my_test_method" do
    it "returns true" do
      subject = described_class.new # BowlingGame.new

      expect(subject.my_test_method).to eq(true)
    end
  end

  describe "#my_test_method" do
    it "scores a 'simple' game of bowling" do
      simple = [1, 5, 4, 4, 8, 0, 5, 3, 0, 0, 4, 5, 2, 3, 8, 1, 7, 1, 1, 1]
      subject = described_class.new

      expect(subject.score(simple)).to eq(63)
    end

    it "scores a game with -'s for 0's" do
      simple_2 = [1, 5, 4, 4, 8, "-", 5, 3, "-", "-", 4, 5, 2, 3, 8, 1, 7, 1, 1, 1]
      subject = described_class.new

      expect(subject.score(simple_2)).to eq(63)
    end

    it "scores a game with '/' for spares" do
      spares = [1, 5, 4, 4, 8, "/", 5, 3, "-", "-", 4, 5, 2, 3, 8, "/", 7, 1, 1, 1]
      subject = described_class.new

      expect(subject.score(spares)).to eq(78)
    end

    it "scores a game with 'X' for strikes" do
      strikes = [1, 5, 4, 4, 8, "/", 5, 3, "X", 4, 5, 2, 3, 8, "/", 7, 1, 1, 1]
      subject = described_class.new

      expect(subject.score(strikes)).to eq(97)
    end
  end
end