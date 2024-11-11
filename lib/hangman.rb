class Hangman
  def initialize(word)
    @word = word
  end

  def show_word
    puts @word
  end

  def start_game
    puts "It's time to play"
    show_word
  end
end