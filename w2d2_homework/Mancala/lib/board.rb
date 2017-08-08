class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    i = 0
    14.times do
      if i == 6 || i == 13
        @cups[i] = []
      else
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
      i += 1
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    i = start_pos
    until stones.empty?
      i += 1
      if i == 6
        @cups[6] << stones.pop if current_player_name == @player1
      elsif i == 13
        @cups[13] << stones.pop if current_player_name == @player2
      else
        @cups[i % 14] << stones.pop
      end
    end

    render
    next_turn(i % 14)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx] == [:stone]
      return :switch
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
    if @cups[0..5].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
      return true
    end
    return false
  end

  def winner
    comp = @cups[6].length <=> @cups[13].length
    if comp == 1
      @player1
    elsif comp == -1
      @player2
    elsif comp == 0
      :draw
    end
  end
end
