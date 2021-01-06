require 'byebug'
require_relative 'board'

class Game
  attr_reader :board, :player_x, :player_y

  def initialize(player_x, player_o)
    @player_x = player_x
    @player_o = player_o
    @board = Board.new
    @game_over = board.game_over
    @someone_won = false
    @total_rounds = 0
  end

  def current_turn_to_play
    if board.player_x_turn
      "#{player_x.name}'s turn (x)"
    else
      "#{player_o.name}'s turn (o)"
    end
  end

  def make_play(selection)
    if board.play_turn_and_swap(selection)
      @game_over = board.game_over
      @someone_won = @game_over
      @total_rounds += 1

      if draw?
        @game_over = true
        @someone_won = false
      end

      true
    else
      return false unless draw?

      @game_over = true
      @someone_won = false
    end
  end

  private

  def draw?
    @total_rounds == 9
  end
end
