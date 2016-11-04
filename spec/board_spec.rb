require File.dirname(__FILE__) + "/../lib/board"
describe Board do

  describe "#choose_user" do
    before :each do
      @board = Board.new([[0,1],[1,0]], 2)
    end

    it "returns false if solution has been found" do
      expect(@board.choose_user([1,1], 1)).to be_falsey
    end

    it "returns false if can't choose a user" do
      expect(@board.choose_user([1,nil],1)).to be_falsey
    end

    it "returns the new solution with chosen user" do
      expect(@board.choose_user([1,nil],0)).to eql([1,0])
    end
  end

  describe "#solve_board" do
    it "returns top down possible solutions" do
      possibilities = [
        [1,0],
        [0,1]
      ]
      users = 2
      board = Board.new(possibilities, users)
      solutions = board.solve_board()
      expect(solutions.include?([0,1])).to be_truthy
    end

    it "returns bottom up possible solutions" do
      possibilities = [
        [0,1],
        [1,0]
      ]
      users = 2
      board = Board.new(possibilities, users)
      solutions = board.solve_board()
      expect(solutions.include?([1,0])).to be_truthy
    end

    it "returns single user solutions" do
      possibilities = [
        [1,1],
        [0,0]
      ]
      users = 2
      board = Board.new(possibilities, users)
      solutions = board.solve_board()
      expect(solutions.include?([0,0])).to be_truthy
    end

    it "returns returns [] when no solutions" do
      possibilities = [
        [0,0],
        [0,0]
      ]
      users = 2
      board = Board.new(possibilities, users)
      solutions = board.solve_board()
      expect(solutions.count).to eql(0)
    end
  end
end
