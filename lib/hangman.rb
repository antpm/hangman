class Hangman
  def initialize(word)
    @word = word.downcase
    @guesses = 0
    @win = false
    @hidden_word = @word.gsub(/[a-z]/, "_")
    @guessed_letters = []

  end

  def show_word
    puts @word
  end

  def play_game
    puts "It's time to play"
    until @guesses >= 5 or @win
      puts "Your word:"
      puts @hidden_word
      puts "Incorrect Guesses: #{@guesses}/5"
      puts "Guess a letter: "
      guess = gets.chomp
      until validate_guess(guess) 
        puts "Guess a letter: "
        guess = gets.chomp
      end
      @guessed_letters.append(guess)

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
      puts "The word was: #{@word}"
    end
  end

  def check_guess(guess)
    if @word.include?(guess)
      insert_letter(guess)
      return true
    else
      return false
    end
  end

  def insert_letter(letter)
    @word.each_char.with_index do |char, i|
      if letter == char
      @hidden_word[i] = letter
      end
    end
  end

  def validate_guess(guess)
    unless guess =~ /[a-z]/
      puts "Invalid guess"
      return false
    end
    unless guess.length == 1
      puts "Only one letter can be guessed at a time. Try again."
      return false
    end
    if @guessed_letters.include?(guess)
      puts "Letter has been guessed already. Try again."
      return false
    end
    return true
  end
end