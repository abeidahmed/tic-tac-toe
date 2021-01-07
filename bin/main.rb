#!/usr/bin/env ruby

require_relative '../lib/player'
require_relative '../lib/game'

EXIT_KEY = 'q'.freeze

def register_player_for(player_name)
  puts "✨ Please enter Player #{player_name}'s name ✨"

  player_name = gets.chomp.to_s.strip

  while player_name.empty?
    puts 'Please enter a valid name'
    player_name = gets.chomp.to_s
  end

  player_name
end

puts ''
puts '🙌 Welcome to Tic Tac Toe 🙌'
puts ''
puts 'Before we begin with the game, register yourself and your partner'
puts "Press 'Enter' to continue or press '#{EXIT_KEY}' to exit the game"

command = gets.chomp.to_s.strip
exit if command == EXIT_KEY

puts ''

player_x = register_player_for('x')
puts ''
player_o = register_player_for('o')

while player_x.downcase == player_o.downcase
  puts ''
  puts "Players should have different names. Enter a different name for 'Player O'"
  puts ''
  player_o = register_player_for('o')
end

player_x = Player.new(player_x, 'x')
player_o = Player.new(player_o, 'o')

game = Game.new(player_x, player_o)

until game.game_over
  puts game.show_updated_board
  puts game.current_turn_to_play

  player_selection = gets.chomp.to_i

  until game.make_play(player_selection)
    puts game.show_updated_board
    puts ''
    puts 'Choose a valid move, write a non reserved number between 1 to 9'
    puts ''
    puts game.current_turn_to_play

    player_selection = gets.chomp.to_i
  end
end

if game.someone_won
  puts game.show_message
else
  puts ''
  puts 'The game ended is a Draw'
  puts ''
end
