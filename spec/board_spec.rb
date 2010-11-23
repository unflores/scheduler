require File.dirname(__FILE__) + "/../lib/board"
describe Board do
  
  describe "#initialize" do
    it "should return a board with the correct height and width" do
      b = Board.new(5,6)
      b[0].size.should == 5
      b.size.should == 6
    end  
  end
  
  describe "#choice_left?" do
    before do
      @board = Board.new(2,2)
      @board[0][0] = 1
      @board[1][1] = 1
    end

    it "should return true if there is a 1 in the current column " do
      @board.choice_left?(0).should == true
    end

    it "should return false if there is not a 1 in current column " do
      @board[0][0] = 0
      @board.choice_left?(0).should == nil
    end
  end

  describe "#take_choice" do
    before do
      @board = Board.new(2,2)
      @board[0][0] = 1
      @board[1][1] = 1
    end

    it "should return new object with x in place of 1 for the specific column" do
      new_board = @board.take_choice(0)
      new_board[0][0].should == 'x'
      new_board.object_id.should_not == @board.object_id
    end
  end


  
end