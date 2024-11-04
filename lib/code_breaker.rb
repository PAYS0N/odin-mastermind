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
      guess = ask_guess
      until num_guesses == 12 || guess == code
        display_human_feedback(guess, code)
        guess = ask_guess
        num_guesses += 1
      end
      num_guesses != 12
    end

    def ask_guess
      puts "What is your guess? The possible colors are p, b, r, y, g, t. Reply in format: pppp"
      guess = gets.chomp
      until valid?(guess)
        puts "Invalid guess. Guess must be 4 characters consisting of p, b, r, y, g, or t."
        guess = gets.chomp
      end
      guess
    end

    def display_human_feedback(guess, code)
      puts "Your guess: #{guess}"
      puts "The code: #{code}"
    end

    def valid?(code)
      code.chars.reduce(true) { |all_valid, char| all_valid && %w[p b r y g t].include?(char) } && code.length == 4
    end
  end
end
