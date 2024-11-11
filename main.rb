file_name = 'words.txt'

if File.exist? file_name
  word_list = File.readlines(file_name)
  
  word = ''
  until word.length.between?(5,12)
    line_num = Random.rand(word_list.length - 1)
    word = word_list[line_num]
    puts word
  end
else 
  puts "File not found"
end