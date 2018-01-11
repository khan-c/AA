def knapsack(weights, values, capacity)
  return 0 if capacity == 0 || weights.length == 0
  solution_table = knapsack_table(weights, values, capacity)
  solution_table[capacity][-1]
end

def knapsack_table(weights, values, capacity)
  solution_table = []

  (0..capacity).each do |c|
    solution_table[c] = []

    (0...weights.length).each do |w|
      if c == 0
        solution_table[c][w] = 0

      elsif w == 0
        solution_table[c][w] = weights[0] > c ? 0 : values[0]

      else
        option1 = solution_table[c][w - 1]

        option2 = c < weights[w] ? 0 : solution_table[c - weights[w]][w - 1] + values[w]

        optimum = [option1, option2].max

        solution_table[c][w] = optimum
      end
    end
  end

  solution_table
end
