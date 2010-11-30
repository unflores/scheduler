require File.dirname(__FILE__) + "/../lib/person"
describe Person do
  describe "#is_available_for?" do
    it " should return true when available" do
      person = Person.new(['Austin'," 1"," 0", "1"])
      person.is_available_for?("friday").should == true
    end

    it " should return false when not available" do
      person = Person.new(['Austin'," 1"," 0", "1"])
      person.is_available_for?("saturday").should == false
    end
  end
  describe "#key" do
    it "should return a symbol of the [first][lastname] with spaces turned into underscores" do
      person = Person.new(['Austin'," 1"," 0", "1"])
      person_w_space = Person.new(['Austin Flores'," 1"," 0", "1"])
      person.key.should == :Austin
      person_w_space.key.should == :Austin_Flores
    end
  end
  describe "#take" do
    it "should return a person with one less option" do
      person = Person.new(['Austin'," 1"," 0", "1"])
      person.take("friday").availability.should == Person.new(['Austin'," 0"," 0", "1"]).availability
    end
  end
end