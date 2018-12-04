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
        puts "------New Turn------"
        sleep 0.7
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

    end

    def loses_life
      players[@turn.current_player].lives -= 1
      puts "#{players[@turn.current_player].name} loses 1 point"
      if players[@turn.current_player].lives == 0
        @game_over = true
        @turn.play_next
        puts "#{players[@turn.current_player].name} wins the GAME !!!!"
      end
    end


    def summary
      sleep 0.7
      puts "------SUMMARY------"
      players.each {|player| puts "#{player.name} has #{player.lives} points"}
    end
    
end