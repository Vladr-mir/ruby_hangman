# frozen_string_literal: false

# HangMan
class HangMan
  attr_reader :secret_word, :max

  def initialize(secret_word)
    @secret_word = secret_word
    @max = 6
  end

  def guessed?(guess)
    hint(guess) == @secret_word
  end

  def guess(guess)
    formatted = @secret_word
    guess = guess.split('').uniq

    guess.each do
      formatted = hint_letter
    end
    formatted
  end

  def last_guessed?(guess)
    guess = guess.split('')
    letter = guess[-1]
    @secret_word.split('').include?(letter)
  end

  def hint(guess)
    guess = guess.split('')
    format = @secret_word
    helper = format

    guess.each { |guess_char| helper = helper.delete(guess_char) }

    @secret_word.split('').each do |secret_char|
      helper.split('').each do |helper_char|
        format = format.gsub(helper_char, '_') if secret_char == helper_char
      end
    end
    format
  end
end
