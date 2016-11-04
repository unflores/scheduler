class Person

  attr_accessor :name, :availability
  def initialize(person)
    person = person.collect{|field| field.strip}
    @name = person.shift
    @availability = person.map(&:to_i)
  end

  def to_hash
    {availability: @availability, name: @name}
  end

end


