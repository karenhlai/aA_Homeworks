class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = sequence_length
    @game_over = false
    @seq = seq
  end

  def play
    until game_over == true
      take_turn
      system('clear')
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    #loop through @seq, for ea color, puts color
    #sleep for one second (sleep 0.75)
    #clear system
    #sleep for another half second
  end
  
  def require_sequence
    puts "Repeat a color: "
    @seq.each do |color|
      color_input = gets.chomp.downcase
      if color != color_input
        @game_over = true
        break
      end
    end
 #sleep 0.25
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You've passed this round! Get ready for the next..."
  end

  def game_over_message
    puts "Game over! You've passed #{@sequence_length-1} rounds."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
