class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    puts "Welcome to Simon!"
    print "Try to repeat the following sequence! It may start off easy,"
    puts " but it will definitely get harder!"

    5.downto(1).each do |num|
      print "#{num}... "
      sleep(1)
    end

    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    system("clear")

    show_sequence
    require_sequence

    unless game_over
      round_success_message
      sleep(1)
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

    seq.each do |color|
      puts color.upcase
      sleep(1)
      system("clear")
      sleep(0.25)
    end

    system("clear")
  end

  def require_sequence
    seq.each do |color|
      system("clear")
      puts "What's the next color?"

      input = gets.chomp
      if color != input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Successful round!"
  end

  def game_over_message
    puts "That's not right! Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  Simon.new.play
end
