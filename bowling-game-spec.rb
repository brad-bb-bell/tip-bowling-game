require_relative "bowling-game"

RSpec.describe BowlingGame do
  describe "#my_test_method" do
    it "returns true" do
      subject = described_class.new # BowlingGame.new

      expect(subject.my_test_method).to eq(true)
    end
  end

  describe "#my_test_method" do
    it "score a 'simple' game of bowling" do
      pins = [1, 5, 4, 4, 8, 0, 5, 3, 0, 0, 4, 5, 2, 3, 8, 1, 7, 1, 1, 1]
      subject = described_class.new

      expect(subject.score(pins)).to eq(63)
    end

    it "score a game with -'s for 0's" do
      pins = [1, 5, 4, 4, 8, "-", 5, 3, "-", "-", 4, 5, 2, 3, 8, 1, 7, 1, 1, 1]
      subject = described_class.new

      expect(subject.score(pins)).to eq(63)
    end

    # it "score a game with '/' for spares" do
    #   pins = [1, 5, 4, 4, 8, "/", 5, 3, "-", "-", 4, 5, 2, 3, 8, "/", 7, 1, 1, 1]
    #   subject = described_class.new

    #   expect(subject.score(pins)).to eq(78)
    # end
  end
end
