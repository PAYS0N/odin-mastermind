# frozen_string_literal: true

# module to contain the game mastermind
module Mastermind
  # class for the entity that tries to guess the code
  class CodeMaker
    def create_code_computer
      "aaaa"
    end

    def create_code_human
      puts "What is your code? The possible colors are p, b, r, y, g, t. Reply in format: pppp"
      gets.chomp
    end
  end
end
