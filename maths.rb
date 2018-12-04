



class Game
  attr_reader :players

  def initialize
    @number_of_players = 2
    @players = []
    @turn = Turn.new
    @game_over = false
  end

    def initialize_players
      counter = 1
      while counter <= @number_of_players
        puts "Please enter the name of player #{counter}:"
        name = gets.chomp 
        players << Player.new(name)
        counter += 1
      end 
    end

    def run 
      initialize_players
    while(!@game_over)
      player_name = players[@turn.current_player].name
      puts "#{player_name} you play !"
      puts "------Question-------"
      question = Question.new(player_name)
      if (question.init) 
        puts 'Good answer!'
      else
        loses_life
      end
      summary
      @turn.play_next
    end


      # while (!game_over)
      #  question = Question.new
      #  question.init
      

      # end
    end

    def loses_life
      players[@turn.current_player].lives -= 1
      puts "#{players[@turn.current_player].name} loses 1 point"
      if players[@turn.current_player].lives == 0
        @game_over = true
        puts "#{players[@turn.current_player].name} loses the GAME !!!!"
      end
    end


    def summary
      puts "------SUMMARY------"
      players.each {|player| puts "#{player.name} has #{player.lives} points"}
    end




end


class Player
  attr_accessor :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end
  
end

class Question
  attr_reader :number1, :number2, :symbol, :result

  def initialize name
    @name = name
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @symbol = ['-', '*', '+'].shuffle.first
  end
  
  def init
    puts "#{@name}, how much is #{number1} #{symbol} #{number2}?"
    @answer = gets.chomp.to_i
    return @answer == do_the_math
  end
  
  def do_the_math
    if @symbol == '-'
      return self.number1 - self.number2
    elsif @symbol == '+'
      return self.number1 + self.number2
    elsif @symbol == '*'
      return self.number1 * self.number2
    end
  end
  
end



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

