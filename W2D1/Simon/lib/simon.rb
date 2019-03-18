class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length=1, seq=[])
    @sequence_length = sequence_length
    @game_over = false
    @seq = seq
  end

  def play
    take_turn until game_over == true
    game_over_message
    reset_game
  end

  def take_turn
    if @game_over == true
      show_sequence
      require_sequence
    else 
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end
  
  def require_sequence #working on this spec
    puts "Repeat a color: "
    color_input = gets.chomp.downcase
    @game_over = true if !seq.include?(color_input)
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You've passed this round!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
