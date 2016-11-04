describe Filters::MaxUsed do
  describe "#perform" do
    before :each do
      @filter = Filters::MaxUsed.new(3)
    end

    it "filters out solutions that are at the max" do
      expect(@filter.perform([[1,1,1]])).to eql([])
    end
    it "doesn't filter out solutions less than the max" do
      expect(@filter.perform([[1,1,2]])).to eql([[1,1,2]])
    end
  end
end
