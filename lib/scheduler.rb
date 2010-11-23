class Scheduler
  require 'csv'
  require 'lib/person'
  attr_accessor :people
  
  def initialize
    @schedule_to_fill = ['friday', 'saturday', 'sunday']
    @people = {}
    @people_pool
    CSV::Reader.parse(File.open("./example/schedule.csv", 'r')) do |row|
      person = Person.new(row)
      @people[person.key] = person
    end
  end

=begin
  find schedule
    schedule_to_meet.each
      if person.match(match) and correct schedule = find schedule(people.copy.reject{|a| a == match })
        return correct schedule 
    return nil
=end
  def find_schedule(schedule = {}, people = @people, responsibilities = @schedule_to_fill)
    return schedule if responsibilities.nil? or responsibilities.empty?
    people.each do |key, person|
      responsibilities.each do |responsibility|
        if person.is_available_for?(responsibility)
          person.take(responsibility)
          find_schedule(schedule, get_people_minus_responsibility(people,person,responsibility) , responsibilities - [responsibility])
          schedule[responsibility] =  person
          return schedule
        end
      end
    end
    
    return false
  end

  def get_people_minus_responsibility(people,person, responsibility) 
    peeps = people.clone
    pers  = person.clone
    peeps[pers.key] = pers.take(responsibility)
    peeps
  end  
end

s = Scheduler.new
puts s.find_schedule.inspect
