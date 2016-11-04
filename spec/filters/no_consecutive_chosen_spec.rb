describe Filters::NoConsecutiveChosen do
  describe "#perform" do
    it "excludes solutions with a user chosen consecutively" do
      @filter = Filters::NoConsecutiveChosen.new()
      expect(@filter.perform([[1,1,0]])).to eql([])
    end

    it "excludes solutions with a user chosen consecutively setting a max" do
      @filter = Filters::NoConsecutiveChosen.new(4)
      expect(@filter.perform([[1,1,1,0]])).to eql([[1,1,1,0]])
    end

    it "doesn't filter solutions with users chosen non-consecutively" do
      @filter = Filters::NoConsecutiveChosen.new()
      expect(@filter.perform([[1,2,0]])).to eql([[1,2,0]])
    end

  end
end
