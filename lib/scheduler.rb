class Scheduler
  attr_accessor :people

  def initialize(csv)
    @people = []
    csv_data = CSV::read(File.open(csv, 'r'))
    headers = csv_data.shift
    @slots = headers[1..-1].map(&:strip)

    csv_data.each do |row|
      person = Person.new(row)
      @people.push person
    end
    @board = Board.new(@people.map(&:availability), @people.count)
  end

  def find_schedules()
    @solutions = @board.solve_board()
    {
      slots: @slots,
      schedules: @solutions,
      people: @people.map(&:to_hash)
    }
  end

end
