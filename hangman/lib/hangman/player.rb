module Hangman
  class Player

    # No argument constructor for creating a new instance of the player class
    attr_accessor :guesses
    def initialize
      @guesses = []
    end

    #A string representation will print all of our guesses
    def to_s
      print "Guesses so far >> "
      @guesses.each do |el|
        print "#{el} ";
      end
    end
  end
end
