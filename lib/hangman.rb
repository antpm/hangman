class Hangman
  def initialize(word)
    @word = word
    @guesses = 0
    @win = false
    @hidden_word = @word.gsub(/[a-z A-Z]/, "_")

  end

  def show_word
    puts @word
  end

  def start_game
    puts "It's time to play"
    until @guesses >= 5 or @win
      puts "Your word:"
      puts @word
      puts @hidden_word
      puts "Incorrect Guesses: #{@guesses}"
      puts "Guess a letter: "
      guess = gets.chomp
      if check_guess(guess)
        puts "Correct"
        if @hidden_word == @word
          @win = true
        end
      else 
        puts "Incorrect"
        @guesses += 1
      end
    end

    if @win
      puts "You won!"
    else 
      puts "You lost..."
    end
    
  end

  def check_guess(guess)
    if @word.include?(guess)
      @word.each_char.with_index do |letter, i|
        if guess == letter
        @hidden_word[i] = guess
        end
      end
      return true
    else
      return false
    end
  end
end