# frozen_string_literal: true

require_relative("code_breaker")
require_relative("code_maker")

# module to contain the game mastermind
module Mastermind
  # manages game
  class GameManager
    def initialize
      @breaker = Mastermind::CodeBreaker.new
      @maker = Mastermind::CodeMaker.new
    end

    def play_game
      choice = ask_roles
      code_broken = assign_roles(choice)
      if code_broken
        puts "Code broken!"
      else
        puts "Code safe!"
      end
    end

    private

    def ask_roles
      puts "Do you want to make the code or guess it? (reply M/G)"
      choice = nil
      until choice
        reply = gets.chomp
        choice = validate_role_choice(reply)
      end
      choice
    end

    def assign_roles(choice)
      if choice == "m"
        code = @maker.create_code_human
        @breaker.break_code_computer(code)
      else
        code = @maker.create_code_computer
        @breaker.break_code_human(code)
      end
    end

    def validate_role_choice(choice)
      return "m" if %w[M m Make make].include?(choice)
      return "g" if %w[G g Guess guess].include?(choice)

      false
    end
  end
end
