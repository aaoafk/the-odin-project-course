module Mastermind
  class CodeBreaker

    attr_reader :PINS
    def initialize
      @PINS = {
        red: ("O".bg_red),
        green: "O".bg_green,
        blue: "O".bg_blue,
        gray: "O".bg_gray,
        brown: "O".bg_brown,
        magenta: "O".bg_magenta,
        black: "O".bg_black,
        cyan: "O".bg_cyan
      }
    end
  end
end
