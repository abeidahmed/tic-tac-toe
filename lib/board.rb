require 'byebug'

class Board
  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @player_x_turn = true
    @game_over = false
    @player_x_selections = []
    @player_o_selections = []
  end

  def play_turn_and_swap(selection)
    return false unless valid_play?(selection)

    return false if already_taken?(selection)

    # to get the selection
    # num < 4 it should be [0, num - 1]
    # num < 7 it should be [1, num - 4]
    # num <= 9 it should be [2, num - 7]

    true
  end

  private

  def already_taken?(selection)
    get_item_from_selection(selection).is_a?(String)
  end

  def get_item_from_selection(selection)
    coordinate = get_cord_from_selection(selection)
    @board[coordinate.first][coordinate.last]
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

  def valid_play?(selection)
    selection.positive? && selection <= 9
  end
end
