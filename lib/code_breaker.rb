# frozen_string_literal: true

require "colorize"

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
      num_exact_correct, remaining = exact_guess(guess, code)
      num_partial_correct = partial_guess(guess, remaining)
      display_pins(num_exact_correct, num_partial_correct)
    end

    def exact_guess(guess, code)
      correct = 0
      remaining = Hash.new(0)
      0.upto(3) do |i|
        if guess[i] == code[i]
          correct += 1
        else
          remaining[code[i]] += 1
        end
      end
      [correct, remaining]
    end

    def partial_guess(guess, remaining)
      partial_correct = 0
      0.upto(3) do |i|
        unless remaining[guess[i]].zero?
          partial_correct += 1
          remaining[guess[i]] -= 1
        end
      end
      partial_correct
    end

    def display_pins(exact, partial)
      exact.times do
        print "o".colorize(:red)
      end
      partial.times do
        print "o".colorize(:white)
      end
      (4 - exact - partial).times do
        print "o".colorize(:grey)
      end
      puts ""
    end

    def valid?(code)
      code.chars.reduce(true) { |all_valid, char| all_valid && %w[p b r y g t].include?(char) } && code.length == 4
    end
  end
end
