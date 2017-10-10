class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, idx|
      4.times { cup << :stone } unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    if !(0..12).cover?(start_pos) || cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []

    cup_pos = start_pos
    until stones.empty?
      cup_pos += 1

      cup_pos = 0 if cup_pos > 13

      if cup_pos == 13
        cups[cup_pos] << stones.pop if current_player_name == @name2
      elsif cup_pos == 6
        cups[cup_pos] << stones.pop if current_player_name == @name1
      else
        cups[cup_pos] << stones.pop
      end
    end

    render
    next_turn(cup_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 13 || ending_cup_idx == 6
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    [cups[7..12], cups.take(6)].any? do |side|
      side.all? { |cup| cup.empty? }
    end
  end

  def winner
    case cups[6].count <=> cups[13].count
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
