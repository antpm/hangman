require_relative 'lib/hangman'


def select_word(word = '')
  file_name = 'words.txt'
  if File.exist? file_name
    word_list = File.readlines(file_name)
    until word.length.between?(5,12)
      line_num = Random.rand(word_list.length - 1)
      word = word_list[line_num]
    end
  else
    puts "File not found"
  end
  word
end

def new_game
  continue = true

  while continue
    word = select_word
    hangman = Hangman.new(word)
    hangman.play_game
    if hangman.quit
      continue = false
    else
      puts "Play again? Y/N"
      unless gets.chomp.downcase == 'y'
        continue = false
      end
    end
  end
end

def continue_game(save)
  continue = true
  while continue
    hangman = Hangman.new
    hangman.load_game(save)
    if hangman.quit
      continue = false
    else
      puts "Play again? Y/N"
      unless gets.chomp.downcase == 'y'
        continue = false
      end
    end
  end
end



puts "Welcome to Hangman"
puts "Select an options:"
puts "(1)Start New Game"
puts "(2)Continue Saved Game"

input = gets.chomp.to_i
until input == 1 or input == 2
  puts "Invalid Selection. Please try again."
  input = gets.chomp.to_i
end

case input
when 1 
  new_game
when 2
  puts "Select a Save File to load"
  saves = Dir.children('saves').sort
  save_count = saves.length
  saves.each_with_index do |file, i|
    puts "(#{i + 1}) #{file.sub('.yml', '')}"
  end
  save_selection = gets.chomp.to_i
  unless save_selection.between?(1, save_count)
    puts "Invalid Selection, try again:"
    save_selection = gets.chomp.to_i
  end
  continue_game(saves[save_selection - 1])
end


puts "Goodbye"


