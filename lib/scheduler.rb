class Scheduler
  attr_accessor :people

  def initialize(csv)
    @people = []
    csv_data = CSV::read(File.open(csv, 'r'))
    headers = csv_data.shift
    @slots    = headers[1..-1].map(&:strip)
    @filters  = []

    csv_data.each do |row|
      person = Person.new(row)
      @people.push person
    end
    @board = Board.new(@people.map(&:availability), @people.count)
  end

  def add_filter(sym, *args)
    class_string = sym.to_s.capitalize.gsub(/\_([a-z])/){|thing| thing.upcase }.gsub('_','')
    klass = Kernel.const_get("Filters::#{class_string}")
    raise "Don't add the same filter multiple times" if @filters.map(&:class).include? klass
    @filters << klass.new(*args)
  end

  def find_schedules()
    @solutions = @board.solve_board()
    @filters.each do |filter|
      @solutions = filter.perform(@solutions)
    end
    {
      slots: @slots,
      schedules: @solutions,
      people: @people.map(&:to_hash)
    }
  end

end
