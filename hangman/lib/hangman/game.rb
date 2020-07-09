module Hangman
  class Game

    #we can read words
    attr_reader :words
    def initialize(player)
      @words = []
      File.open("5desk.txt", 'r') do |file|
        while !file.eof?
          @words << file.readline.chomp
        end
      end
      @player = player #Also include the link to the player because we'll need him to know what current state is later
      @secret = words.sample
      @tries = 7
    end


    #This will be the method for printing the word to terminal with some secret formatting
    private
    def print_word_obscured
      print "Your word is: "
      @secret.chars.each do |el|
        if @player.guesses.include?(el)
          print "#{el} "
        else
          print "_ "
        end
      end
      puts ""

      puts "You have #{@tries} tries left!"
    end

    #test if game is over!
    def game_over?
      @secret.chars.all? { |el|
        @player.guesses.include?(el)
      }
    end

    #This will be the method for serializing
    def serialize
      YAML::dump(self)
    end

    #This will be the method for unserializing
    def self.deserialize(yaml_string)
      YAML::load(yaml_string)
    end

    public
    def start_game
      puts "Welcome to hangman !!!"
      print_word_obscured
      guess = nil
      until game_over?
        break if @tries <= 0
        puts "#{@player.to_s}"
        print "Enter your guess >> "
        guess = gets.chomp
        @player.guesses << guess
        @tries = @tries - 1
        print_word_obscured
      end
    end
  end
end
