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
    @first = person.shift
    @availability = person
  end
  
end


