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

continue = true

while continue
  word = select_word
  hangman = Hangman.new(word)
  hangman.play_game
  puts "Play again? Y/N"
  unless gets.chomp.downcase == 'y'
    continue = false
  end
end

puts "Goodbye!"


