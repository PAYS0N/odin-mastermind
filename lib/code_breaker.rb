# frozen_string_literal: true

require "colorize"

# module to contain the game mastermind
module Mastermind
  # class for the entity that tries to guess the code
  class CodeBreaker
    def break_code_computer(code)
      num_guesses = 0
      loop do
        guess = generate_guess
        display_guess(guess)
        num_guesses += 1
        break if num_guesses == 12 || guess == code
      end
      guess == code
    end

    def generate_guess
      code = []
      4.times do
        code.push(%w[p b r y g t][rand(0...6)])
      end
      code.join
    end

    def display_guess(guess)
      puts "Computer's guess: #{guess}"
      sleep(2)
    end

    def break_code_human(code)
      num_guesses = 1
      guess = ask_guess
      until num_guesses == 12 || guess == code
        display_human_feedback(guess, code)
        guess = ask_guess
        num_guesses += 1
      end
      guess == code
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
      num_exact_correct, num_partial_correct = evaluate_guess(guess, code)
      display_pins(num_exact_correct, num_partial_correct)
    end

    def evaluate_guess(guess, code)
      correct = 0
      guess_chars = Hash.new(0)
      code_chars = Hash.new(0)
      0.upto(3) do |i|
        if guess[i] == code[i]
          correct += 1
        else
          guess_chars[guess[i]] += 1
          code_chars[code[i]] += 1
        end
      end
      [correct, evaluate_dicts(guess_chars, code_chars)]
    end

    def evaluate_dicts(guess_chars, code_chars)
      partial = 0
      guess_chars.each do |k, v|
        v.times do
          if code_chars[k].positive?
            partial += 1
            code_chars[k] -= 1
          end
        end
      end
      partial
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
