require_relative 'board'

class Game
  attr_reader :player_x, :player_o, :show_message, :game_over, :someone_won

  def initialize(player_x, player_o)
    @player_x = player_x.mark == 'x' ? player_x.name.to_s : player_o.name.to_s
    @player_o = player_o.mark == 'o' ? player_o.name.to_s : player_x.name.to_s
    @board = Board.new
    @game_over = @board.game_over
    @someone_won = false
    @total_rounds = 0
    @show_message = ''
  end

  def current_turn_to_play
    if @board.player_x_turn
      "#{player_x}'s turn (x)"
    else
      "#{player_o}'s turn (o)"
    end
  end

  def make_play(selection)
    if @board.play_turn_and_swap(selection)
      @game_over = @board.game_over
      @someone_won = @game_over
      @total_rounds += 1

      win_message(@game_over)

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

  def win_message(game_over)
    return unless game_over

    @show_message = @board.player_x_turn ? "#{player_o} won" : "#{player_x} won"
  end

  def show_updated_board
    @board.print_board
  end

  private

  def draw?
    @total_rounds == 9
  end
end
