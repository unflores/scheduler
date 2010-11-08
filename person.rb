=begin
create a program that reads in a csv

Goal:
Given a set of people,
With differing availability,
Create a schedule such that:
  No person volunteers twice a day.
  No person volunteers at the the end of a day and then the beginning of a day

=end
  
class Person

  attr_accessor :first,:last,:availability
  def initialize(person)
    person = person.collect{|field| field.strip}
    @first = person[0]
    @availability = {
      :friday   => person[1],
      :saturday => person[2],
      :sunday   => person[3]
    }
    
  end
  
  def take(responsibility)
    @availability.delete(responsibility.to_sym)
    self
  end
  
  def is_available_for?(responsibility)
    return true if @availability[responsibility.to_sym] == 1
    return false
  end
  
  def key
    "#{first}#{last}".gsub(' ','_').to_sym
  end
end


