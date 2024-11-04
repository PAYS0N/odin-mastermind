# frozen_string_literal: true

# module to contain the game mastermind
module Mastermind
  require_relative("lib/game_manager")

  game = Mastermind::GameManager.new
  game.play_game
end
