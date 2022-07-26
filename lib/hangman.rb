# frozen_string_literal: false

require './lib/dictionary'

# HangMan
class HangMan
  attr_accessor :guess
  attr_reader :secret_word

  def initialize(secret_word)
    @secret_word = secret_word
  end

  def guessed?(guess)
    guess == @secret_word
  end

  def hint(guess)
    formatted = ''
    guess = guess.split('')
    @secret_word.split('').each_with_index do |character, pos|
      if character == guess[pos]
        formatted.concat(character)
      else
        formatted.concat('_')
      end
    end
    formatted
  end
end
