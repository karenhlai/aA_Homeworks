# require_relative 'mancala.rb'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = place_stones
    # render
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    stores = Array.new(14) {[:stone, :stone, :stone, :stone]}
		stores[6] = []
		stores[13] = []
		stores
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = pos
  end
  
  def make_move(start_pos, current_player_name)
		hand = self.cups[start_pos].length #get pieces from cup
		self.cups[start_pos] = [] #set cup to 0
    #until loop add each cup by one, skip opponent's cup     
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if self.cups[6].empty? || self.cups[13].empty?
    # @cups.each.none? { |cup| cup.empty? }
  end

  def winner
    return :draw if self.cups[6].empty? == self.cups[13].empty?
  end
end
