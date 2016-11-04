module Filters
  # Limit solutions to only those which have not passed a maximum consective limit
  class NoConsecutiveChosen
    def initialize(max = 1)
      @max = max
    end

    def perform(solutions)
      solutions.delete_if do |solution|
        is_consecutive?(solution)
      end
    end

    def is_consecutive?(solution)
      solution.each_with_index do |slot, index|
        if solution.count <= index + @max
          return false
        elsif solution[index..(index+@max)].uniq.count == 1
          return true
        end
      end
    end
  end

end
