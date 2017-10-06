class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    pair_idx = @map.index { |pair| pair[0] == key }
    pair_idx ? @map[pair_idx][1] = value : @map.push([key, value])

    [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }

    nil
  end

  def remove(key)
    if lookup(key)
      pair = [key,lookup(key)]
      @map.delete(pair)
      return pair
    end
    nil
  end

  def show
    @map.dup
  end

end
