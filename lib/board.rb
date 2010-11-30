class Board
  attr_accessor :board
  def initialize(height, width)
    raise "Height or Width cannot be 0!" if height == 0 or width == 0
    @board = Array.new(width)
    @board.map!{|cell| cell = Array.new(height)}
  end
  
  def [](column)
    @board[column]
  end
  
  def height; @board.size end

  def width; @board[0].size end
  
  def choice_left?(column)
    height.times do |row|
      return true if @board[row][column].to_i == 1
    end
    return false
  end
  
  def take_choice!(column)
    height.times do |row|
      if @board[row][column].to_i == 1
        new_board = self.clone(column)
        new_board[row][column] = @board[row][column] = 'x'
        return new_board
      end
    end
    return nil
  end
  
  def set_availability!(person , availability)
    @board[person] = availability.dup.map{|cell| cell.to_i }
  end
  
  def clone(static_column)
    b = Marshal::load(Marshal.dump(self))
    b.board.map! do |row| 
      row[static_column] = 1 if row[static_column] == 'x'
      row
    end
    b
  end
  
  def complete?
    true unless flipped_columns.map{|column| true if column.include? "x"}.include? nil
  end
  
  private
  def flipped_columns
    b = @board.dup
    b.shift.zip(*b)
  end

end