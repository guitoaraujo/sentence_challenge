class Sentence
  def self.last_word_length(sentence)
    return unless sentence.instance_of?(String)
    return unless sentence.length <= 104

    words = sentence.split(' ')
    return unless words.length.positive?

    last_word = words.last
    last_word.gsub!(/\W+/, '') 
    last_word.length   
  end
end