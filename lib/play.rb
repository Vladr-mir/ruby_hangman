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

puts "\nEnter a number other than 0 to save at any time!"

until game_logic.tries >= game_logic.hangman.max
  puts "\n\n"
  puts game_logic.hint
  puts "Previously used letters: [#{used_letters}]"
  puts "You have #{(game_logic.hangman.max - game_logic.tries)} tries"
  guess = gets.chomp.split('')[0]

  if guess.to_i != 0
    game_logic.save(name)
    break
  end
  used_letters.concat "#{guess}\s"

  game_logic.letters.concat guess
  
  if game_logic.make_guess!
    puts "you win!"
    break
  end
end

puts game_logic.hangman.secret_word if game_logic.tries >= game_logic.hangman.max 
