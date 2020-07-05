require_relative '../lib/mastermind.rb'

puts "Welcome to MasterMind!"

board = Mastermind::Board.new({})
game = Mastermind::Game.new({board: board})
game.play_game
