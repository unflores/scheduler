class Board
  def initialize(height, width)
    raise "Height or Width cannot be 0!" if height == 0 or width == 0
    @board = Array.new(width)
    @board.map!{|cell| cell = Array.new(height)}
  end
  
  def [](column)
    @board[column]
  end
  
  def size; @board.size end
  
  def choice_left?(column)
    @board.size.times do |row|
      return true if @board[row][column].to_i == 1
    end
    return false
  end
  
  def take_choice!(column)
    @board.size.times do |row|
      if @board[row][column].to_i == 1
        new_board = self.clone
        @board[column][row]     = 0
        new_board[column][row]  = 'x'
        return new_board
      end
    end
    return
  end
  
  def set_availability!(person , availability)
    @board[person] = availability.dup
  end
  
  def clone
    Marshal::load(Marshal.dump(self))
  end

end