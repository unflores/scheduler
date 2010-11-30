class Scheduler
  require 'csv'
  require 'lib/person'
  require 'lib/board'
  attr_accessor :people
  
  def initialize
    @schedule_to_fill = ['friday', 'saturday', 'sunday']
    @people = []
    CSV::Reader.parse(File.open("./example/schedule.csv", 'r')) do |row|
      person = Person.new(row)
      @people.push person
    end
    @board = Board.new(@people.size, @schedule_to_fill.size)
    @people.each_index{|index| @board.set_availability!(index, @people[index].availability) }
    @columns = []
    @columns[0] = [@board]
  end

  def find_schedule()
    @board.height.times do |current_column|
      @columns.push([])
      @columns[current_column].each do |board|
        while board.choice_left? current_column do
          @columns[current_column + 1].push board.take_choice!(current_column)
        end      
      end
    end
    @columns[-1]
  end

end
