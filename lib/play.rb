# frozen_string_literal: false

require './lib/game_logic'
require './lib/dictionary'

name = 'saved'
dict = Dictionary.new
used_letters = ''

puts 'Enter y to load file'
puts 'Otherwise it will start a new game'
user = gets.chomp

game_logic = if user == 'y'
               GameLogic.load(name)
             else
               GameLogic.new(dict.random_word)
             end

game_logic = GameLogic.new(dict.random_word) if game_logic.nil?

puts "\nEnter"

until game_logic.tries >= game_logic.hangman.max || game_logic.make_guess!
  guess = gets.chomp.split('')[0]
  used_letters.concat "#{guess} ,"

  game_logic.letters.concat guess
  puts game_logic.hint
  puts "Previously used letters: #{used_letters}"
end

puts game_logic.hangman.secret_word
