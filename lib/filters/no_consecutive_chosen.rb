module Filters
  # Limit solutions to only those which have not passed a maximum consective limit
  class NoConsecutiveChosen

    # This is a little complicated, I want to minimum distance to be 1 away(giving a max consecutive choice of 2)
    def initialize(max = 2)
      @max = [max,2].max
      @index_distance = @max - 1 > 0 ? @max - 1 : 2
    end

    def perform(solutions)
      solutions.delete_if do |solution|
        is_consecutive?(solution)
      end
    end

    def is_consecutive?(solution)
      solution.each_with_index do |slot, index|
        if solution.count <= index + @index_distance
          return false
        elsif solution[index..(index+@index_distance)].uniq.count == 1
          return true
        end
      end
    end
  end

end
