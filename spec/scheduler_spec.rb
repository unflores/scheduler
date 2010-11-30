require File.dirname(__FILE__) + "/../lib/scheduler"
describe Scheduler do
  describe "#find_schedule" do
    it "return an array of boards with an x for each column" do
      s = Scheduler.new()
      schedules = s.find_schedule()
      schedules.each do |board|
        board.complete?.should == true
      end
    end    
  end

  #RATING determined by the total differnce from the median value of x-count for each row

  describe "#find_best_schedule" do
    it "return a schedule the lowest rating" do
      1.should == 'not yet tested'
    end    
  end

end