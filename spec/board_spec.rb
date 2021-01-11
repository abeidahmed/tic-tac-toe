require_relative 'spec_helper'
require_relative '../lib/board'

# rubocop:disable Metrics/BlockLength
RSpec.describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'sets the @board to the required array' do
      expect(board.instance_variable_get(:@board)).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end

    it 'sets the @player_x_turn to true' do
      expect(board.instance_variable_get(:@player_x_turn)).to eq(true)
    end

    it 'sets the @game_over to false' do
      expect(board.instance_variable_get(:@game_over)).to eq(false)
    end

    it 'sets the @player_x_selections to an empty array' do
      expect(board.instance_variable_get(:@player_x_selections)).to match_array([])
    end

    it 'sets the @player_o_selections to an empty array' do
      expect(board.instance_variable_get(:@player_o_selections)).to match_array([])
    end
  end

  describe '#play_turn_and_swap' do
    it 'returns false if the selection is not valid' do
      expect(board.play_turn_and_swap(10)).to be_falsy
    end

    it 'switches player turns' do
      board.instance_variable_set(:@player_x_turn, false)
      board.play_turn_and_swap(1)

      expect(board.instance_variable_get(:@player_x_turn)).to be_truthy
    end

    it 'returns false if the position is already taken and the player makes a selection' do
      board.instance_variable_set(:@board, [['x', 2, 3], [4, 5, 6], [7, 8, 9]])

      expect(board.play_turn_and_swap(1)).to be_falsy
    end

    it 'returns true if the postion is available' do
      expect(board.play_turn_and_swap(1)).to be_truthy
    end

    it 'sets the board with (x) if it is player_1 turn' do
      board.instance_variable_set(:@player_x_turn, true)
      board.play_turn_and_swap(1)

      expect(board.instance_variable_get(:@player_x_selections)).to match_array([1])
    end

    it 'sets the board with (o) if it is player_2 turn' do
      board.instance_variable_set(:@player_x_turn, false)
      board.play_turn_and_swap(1)

      expect(board.instance_variable_get(:@player_o_selections)).to match_array([1])
    end

    it 'sets @game_over to true if there is a win pattern' do
      board.play_turn_and_swap(1) # x turn
      board.play_turn_and_swap(4) # y turn
      board.play_turn_and_swap(2) # x turn
      board.play_turn_and_swap(5) # y turn
      board.play_turn_and_swap(3) # x turn

      expect(board.instance_variable_get(:@game_over)).to be_truthy
    end
  end

  describe '#print_board' do
    it 'prints out the updated board' do
      board.instance_variable_set(:@board, [['x', 2, 3], [4, 5, 6], [7, 8, 9]])

      # rubocop:disable Style/StringConcatenation
      expect(board.print_board).to eq(
        "\n| |x| |2| |3| |\n"\
        "***************\n" + "| |4| |5| |6| |\n"\
        "***************\n" + "| |7| |8| |9| |\n"
      )
      # rubocop:enable Style/StringConcatenation
    end
  end
end
# rubocop:enable Metrics/BlockLength
