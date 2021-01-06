class Board
  attr_reader :player_x_turn

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @player_x_turn = true
    @game_over = false
    @player_x_selections = []
    @player_o_selections = []
  end

  def play_turn_and_swap(selection)
    return false unless valid_play?(selection)

    coord = get_cord_from_selection(selection)
    return false if already_taken?(coord)

    if player_x_turn
      mark_it_for(coord, with: 'x')
      @player_x_selections << selection
      check_winner(@player_x_selections)
    else
      mark_it_for(coord, with: 'o')
      @player_o_selections << selection
      check_winner(@player_o_selections)
    end

    swap_turn
    true
  end

  private

  def mark_it_for(coord, with:)
    @board[coord.first][coord.last] = with
  end

  def already_taken?(coordinate)
    @board[coordinate.first][coordinate.last].is_a?(String)
  end

  def get_cord_from_selection(selection)
    if selection < 4
      [0, selection - 1]
    elsif selection < 7
      [1, selection - 4]
    else
      [2, selection - 7]
    end
  end

  def check_winner(player_selections)
    winning_patterns = %w[123 147 159 357 369 258 789 456]

    winning_patterns.each do |pattern|
      win_reg = Regexp.new("((?=.*#{pattern[0]})(?=.*#{pattern[1]})(?=.*#{pattern[2]}))")
      if win_reg.match?(player_selections.join)
        @game_over = true
        return true
      end
    end

    false
  end

  def valid_play?(selection)
    selection.positive? && selection <= 9
  end

  def swap_turn
    @player_x_turn = !@player_x_turn
  end
end
