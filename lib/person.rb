class Person

  attr_accessor :first,:last,:availability
  def initialize(person)
    person = person.collect{|field| field.strip}
    @first = person.shift
    @availability = person
  end
  
end


