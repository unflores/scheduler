class Scheduler
  attr_accessor :people

  def initialize
    @people = []
    csv_data = CSV::read(File.open("./example/schedule.csv", 'r'))
    headers = csv_data.shift
    @schedule_to_fill = headers.shift

    csv_data.each do |row|
      person = Person.new(row)
      @people.push person
    end
    @board = Board.new(@people.map(&:availability), @people.count)
  end

  def find_schedules()
    @board.solve_board()
  end

end
