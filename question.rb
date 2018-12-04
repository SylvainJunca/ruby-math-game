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