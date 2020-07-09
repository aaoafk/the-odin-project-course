require_relative "../lib/hangman.rb"

player = Hangman::Player.new
game = Hangman::Game.new(player)

game.start_game
