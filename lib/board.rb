class Board
  def initialize(possibilities, users)
    @possibilities = possibilities

    @users = users
  end

  # All solution slots have been filled
  def solved?(solution)
    solution.compact.count == solution.count
  end

  # returns new solution or false
  def choose_user(solution, user)
    solution = solution.dup
    solution_needed = solution.compact.count
    return false if solution_needed == solution.count
    if @possibilities[user][solution_needed] == 1
      solution[solution_needed] = user
      solution
    else
      false
    end
  end

  def solve_board()
    solve([], Array.new(@possibilities.first.length), 0)
  end

  def solve(solutions, solution, user)
    if solved?(solution)
      return solutions << solution
    end

    # Solve for this user
    if next_solution = choose_user(solution,user)
      solutions |= solve(solutions, next_solution, user)
    end
    # Solve for next user
    for next_user in (user+1...@users)
      if next_solution = choose_user(solution, next_user)
        solutions |= solve(solutions, next_solution, next_user)
      end
    end
    # Solve for previous User
    for prev_user in (0..user)
      if next_solution = choose_user(solution, prev_user)
        solutions |= solve(solutions, next_solution, prev_user)
      end
    end
    return solutions
  end
end

