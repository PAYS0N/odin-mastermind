# frozen_string_literal: true

# module to contain the game mastermind
module Mastermind
  # class for the entity that tries to guess the code
  class CodeMaker
    def create_code_computer
      code = []
      4.times do
        code.push(%w[p b r y g t][rand(0...6)])
      end
      code.join
    end

    def create_code_human
      puts "What is your code? The possible colors are p, b, r, y, g, t. Reply in format: pppp"
      code = gets.chomp
      until valid?(code)
        puts "Invalid code. code must be 4 characters consisting of p, b, r, y, g, or t."
        code = gets.chomp
      end
      code
    end

    private

    def valid?(code)
      code.chars.reduce(true) { |all_valid, char| all_valid && %w[p b r y g t].include?(char) } && code.length == 4
    end
  end
end
