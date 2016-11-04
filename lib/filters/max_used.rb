module Filters
  # Limit the solutions by a maximum user usage
  class MaxUsed
    def initialize(max)
      @max = max
    end

    def perform(solutions)
      solutions.delete_if do |solution|
        too_many_used?(solution)
      end
    end

    def too_many_used?(solution)
      dups = Hash.new(0)
      solution.each do |value|
        dups[value] += 1
        return true if dups[value] > @max
      end
      false
    end
  end

end
