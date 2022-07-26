# frozen_string_literal: false

require './lib/dictionary'
require './lib/hangman'
require 'yaml'

# Game logic
class GameLogic
  attr_reader :tries, :hangman
  attr_accessor :letters

  def initialize(random_word, tries = 0, letters = '')
    @secret_word = random_word
    @hangman = HangMan.new(@secret_word)
    @tries = tries
    @letters = letters
  end

  def make_guess!
    @tries += 1 unless @hangman.last_guessed?(@letters)
    hangman.guessed?(@letters)
  end

  def hint
    @hangman.hint(@letters)
  end

  def max
    @hangman.max
  end

  def secret_word
    @hangman.secret_word
  end

  def save(name)
    file = File.open("saves/#{name}.yaml", 'w')
    file.write(to_yaml)
  ensure
    file.close
  end

  def self.load(name)
    return nil unless File.exist?("saves/#{name}.yaml")

    data = YAML.load(File.read("saves/#{name}.yaml"))
    new(data[:secret_word], data[:tries], data[:letters])
  end

  private

  def to_yaml
    YAML.dump(
      {
        secret_word: @secret_word,
        tries: @tries,
        letters: @letters
      }
    )
  end
end
