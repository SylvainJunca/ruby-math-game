
class Turn
  attr_reader :current_player

  def initialize
    @current_player = rand(0..1)
  end

  def play_next
    if @current_player == 0
      @current_player = 1
    elsif @current_player == 1
      @current_player = 0
    end
  end
end


new_game = Game.new
new_game.run

