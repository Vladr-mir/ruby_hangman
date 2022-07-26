# frozen_string_literal: false

# Dictionary
class Dictionary
  def initialize
    @path = 'google-10000-english-no-swears.txt'
  end

  def random_word
    length = dictionary_length
    pos = rand(0...length)
    word_at_pos(pos)
  end

  def word_at_pos(pos)
    dictionary_file = File.open(@path)
    dictionary_file.readlines[pos].chomp
  ensure
    dictionary_file.close
  end

  def dictionary_length
    `wc -l < "#{@path}"`.to_i
  end
end
