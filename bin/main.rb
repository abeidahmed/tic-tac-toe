#!/usr/bin/env ruby

EXIT_KEY = 'q'.freeze

def register_player_for(player_name)
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
puts "Press 'Enter' to continue or press '#{EXIT_KEY}' to exit the game"

command = gets.chomp.strip
exit if command == EXIT_KEY

puts ''

player_x = register_player_for('X')
puts ''
player_o = register_player_for('O')

while player_x.downcase == player_o.downcase
  puts ''
  puts "Players should have different names. Enter a different name for 'Player O'"
  puts ''
  player_o = register_player_for('O')
end

puts ''
puts 'Game instructions'
puts ''
puts 'Type your desired position from 1 to 9 as shown below'
puts ''
puts '***************'
puts '| |1| |2| |3| |'
puts '***************'
puts '| |4| |5| |6| |'
puts '***************'
puts '| |7| |8| |9| |'
puts '***************'
puts ''
puts ''

### game flow
game_on = true

while game_on
  print "#{player_x}'s turn : "

  player_x_turn = gets.chomp # get player turn

  puts "#{player_x} plays #{player_x_turn}"
  puts ''
  # show updated board
  puts '--------UPDATED BOARD WILL SHOW HERE INSTEAD OF THE DEMO-------'
  puts '***************'
  puts '| |1| |2| |3| |'
  puts '***************'
  puts '| |4| |5| |6| |'
  puts '***************'
  puts '| |7| |8| |9| |'
  puts '***************'
  puts ''
  puts "You're move is valid"

  # Logic to check the game goes here
  puts 'if no one won and is not draw continue'
  puts ''
  print "#{player_o}'s turn : "

  player_o_turn = gets.chomp

  puts "#{player_o} plays #{player_o_turn}"
  puts ''
  puts '***************'
  puts '| |1| |2| |3| |'
  puts '***************'
  puts '| |4| |5| |6| |'
  puts '***************'
  puts '| |7| |8| |9| |'
  puts '***************'
  puts ''
  puts "You're move is valid"
  puts "You've won the game"

  game_on = false
end
