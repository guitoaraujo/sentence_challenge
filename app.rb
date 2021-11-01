require_relative 'lib/sentence'

class App
  puts 'Please enter your sentence: '
  params = gets.chomp

  @sentence = Sentence.new
  response = @sentence.last_word_length(params)

  puts response
end