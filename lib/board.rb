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
    return true if @board[column].include? 1
  end
  
  def take_choice(column)
    row = @board[column].index(1)
    raise "Need to check if you can take a choice before you take it dummy!" if row.nil?
    new_board = self.clone
    @board[column][row]     = 0
    new_board[column][row]  = 'x'
    new_board
  end
  
  def clone
    Marshal::load(Marshal.dump(self))
  end
end