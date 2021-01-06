#!/usr/bin/env ruby

EXIT_KEY = 'q'.freeze

def register_player_for(player_name)
  puts ''
  puts "Please enter Player #{player_name}'s name"

  player_name = gets.chomp.strip

  while player_name.empty?
    puts 'Please enter a valid name'
    player_name = gets.chomp
  end

  player_name
end

puts ''
puts 'Welcome to Tic Tac Toe'
puts ''
puts 'Before we begin with the game, register yourself and your partner'
puts "Press 'Enter' to continue or press 'q' to exit the game"

command = gets.chomp.strip
exit if command == EXIT_KEY

puts ''

player_x = register_player_for('X')
player_o = register_player_for('O')

while player_x.downcase == player_o.downcase
  puts ''
  puts "Players should have different names. Enter a different name for 'Player O'"
  puts ''
  player_o = register_player_for('O')
end
