class Scheduler
  require 'csv'
  require 'person'
  attr_accessor :people
  
  def initialize
    @schedule_to_fill = ['friday', 'saturday', 'sunday']
    @people = []
    @people_pool
    CSV::Reader.parse(File.open("./example/schedule.csv", 'r')) do |row|
      @people << Person.new(row)
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
    person = people.shift
    
    people.each do |person|
      responsibilities.each do |responsibility|
        puts "#{schedule.inspect}, #{people.inspect},#{responsibilities.dup.reject{|a| a == responsibility}}"
        if person.is_available_for?(responsibility) and correct_schedule = find_schedule(schedule, people.dup.take(responsibility),responsibilities.dup.reject{|a| a == responsibility})
          return schedule << correct_schedule 
        end
      end
    end
    
    
    responsibilities.each do |responsibility|
      if person.is_available_for?(responsibility) and correct_schedule = find_schedule(schedule, people,responsibilities.copy.reject{|a| a == responsibility})
        return schedule << correct_schedule 
      end
    end
    return false
  end
  
end

s = Scheduler.new()
puts s.find_schedule()