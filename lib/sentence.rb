class Sentence
  def last_word_length(sentence)
    return handle_errors('Needs to be a String!') unless sentence.instance_of?(String)
    return handle_errors('Sentence is too long!') unless sentence.length <= 104

    words = sentence.split(' ')
    return handle_errors('Sentence can not be an empty String!') unless words.length.positive?
  
    last_word = set_last_word(words)
    return handle_errors('Invalid sentence!') if last_word.nil?

    last_word.length   
  end

  private

  def handle_errors(msg)
    StandardError.new msg
  end

  def set_last_word(words)
    words.map { |w| w.gsub(/\W+/, '') }.reject(&:empty?).last
  end
end