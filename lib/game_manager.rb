# frozen_string_literal: true

require_relative("code_breaker")
require_relative("code_maker")
require_relative("game_display")

# module to contain the game mastermind
module Mastermind
  # manages game
  class GameManager
    def initialize
      @breaker = Mastermind::CodeBreaker.new
      @maker = Mastermind::CodeMaker.new
      @display = Mastermind::GameDisplay.new
    end

    def play_game
      @display.display("Played game")
      @display.display(@breaker)
      @display.display(@maker)
    end
  end
end
