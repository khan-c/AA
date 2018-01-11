class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 1 => [[1]], 2 => [[2],[1,1]], 3 => [[3],[2,1],[1,2],[1,1,1]] }

  end

  def blair_nums(n)
    # top down
    return @blair_cache[n] if @blair_cache[n]

    ans = blair_nums(n - 1) + blair_nums(n - 2) + (n - 1) * 2 - 1
    @blair_cache[n] = ans

    ans

    # bottom up
    # (3..n).each do |i|
    #   odd = (i - 1) * 2 - 1
    #   @blair_cache[i] = @blair_cache[i - 1] + @blair_cache[i - 2] + odd
    # end
    #
    # @blair_cache[n]
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]], 2 => [[2],[1,1]], 3 => [[3],[2,1],[1,2],[1,1,1]] }

    (4..n).each do |i|
      ans = Array.new

      (1..3).each do |hop_size|
        cache[i - hop_size].each do |el|
          solution = el + [hop_size]
          ans << solution
        end
      end

      cache[i] = ans
    end

    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]

    ans = Array.new

    (1..3).each do |hop_size|
      frog_hops_top_down_helper(n - hop_size).each do |el|
        solution = el + [hop_size]
        ans << solution
      end
    end

    @frog_cache[n] = ans

    ans
  end

  def super_frog_hops(n, k)
    ways_collection = [[[]], [[1]]]
    return ways_collection[n] if n < 2

    (2..n).each do |i|
      new_way_set = []
      (1..k).each do |first_step|
        break if i - first_step < 0
        ways_collection[i - first_step].each do |set|
          new_way_set << set + [first_step]
        end
      end
      ways_collection << new_way_set
    end

    ways_collection[n]
  end

  # def super_frog_hops(n, k)
  #   if k <= n
  #     cache = super_frog_hops_helper(k)
  #     (k + 1..n).each do |i|
  #       ans = Array.new
  #
  #       (1..k).each do |hop_size|
  #         cache[i - hop_size].each do |el|
  #           solution = el + [hop_size]
  #           ans << solution
  #         end
  #       end
  #
  #       cache[i] = ans
  #     end
  #
  #   else
  #     cache = super_frog_hops_helper(n)
  #   end
  #
  #   cache[n]
  # end
  #
  # def super_frog_hops_helper(n)
  #   cache = { 1 => [[1]], 2 => [[2],[1,1]], 3 => [[3],[2,1],[1,2],[1,1,1]] }
  #   return cache if cache[n]
  #
  #   (4..n).each do |hop_size|
  #     jumps = Hash.new
  #
  #     (1...hop_size).each do |key|
  #       cache[key].each do |el1|
  #         cache[hop_size - key].each do |el2|
  #           sol = el1 + el2
  #           jumps[sol] = sol
  #         end
  #       end
  #     end
  #
  #     jumps[[hop_size]] = [hop_size]
  #     cache[hop_size] = jumps.keys
  #   end
  #
  #   cache
  # end

  def knapsack(weights, values, capacity)
    knapsack_table(weights, values, capacity).last.last
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    solutions = []
    len = weights.length
    # solutions << Array.new(len, 0)

    (0..capacity).each do |c|
      solution = Array.new(len, 0)
      weights.each_with_index do |w, i|
        if w <= c
          solution = solutions[c - w].dup

          if solutions.last.last < solution.last + values[i]
            (i...len).each do |si|
              solution[si] += values[i]
            end
          else
            solution = solutions.last.dup
          end

          # solution = solutions[c - w].each_with_index do |v, i2|
          #   v + values[i] if i >= i2
          # end
        end
      end

      solutions << solution
    end
    p solutions[23 + 29]
    solutions
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
