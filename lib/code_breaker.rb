# frozen_string_literal: true

# module to contain the game mastermind
module Mastermind
  # class for the entity that tries to guess the code
  class CodeBreaker
    def break_code_computer(code)
      return true if code == "aaaa"

      false
    end

    def break_code_human(code)
      num_guesses = 1
      puts "What is your guess? The possible colors are p, b, r, y, g, t. Reply in format: pppp"
      guess = gets.chomp
      until num_guesses == 12 || guess == code
        display_feedback(guess)
        puts "What is your guess? The possible colors are p, b, r, y, g, t. Reply in format: pppp"
        guess = gets.chomp
        num_guesses += 1
      end
      num_guesses != 12
    end

    def display_feedback(str)
      puts "Your guess: #{str}"
    end
  end
end
