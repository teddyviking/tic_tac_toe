require_relative "../lib/tic_tac_toe.rb"
 
puts "Welcome to tic tac toe"
bob = TicTacToe::Player.new("X", "bob")
frank = TicTacToe::Player.new("O","frank")
players = [bob, frank]
TicTacToe::Game.new(players).play