describe Filters::MaxUsed do
  describe "#perform" do
    before :each do
      @filter = Filters::MaxUsed.new(2)
    end

    it "filters out solutions that are at the max" do
      expect(@filter.perform([[1,1,1]])).to eql([])
    end
    it "doesn't filter out solutions less than the max" do
      expect(@filter.perform([[1,3,2]])).to eql([[1,3,2]])
    end
  end
end
