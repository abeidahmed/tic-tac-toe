require_relative 'spec_helper'
require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'should set the initial instance variables' do
      expect(board.instance_variable_get(:@board)).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
      expect(board.instance_variable_get(:@player_x_turn)).to eq(true)
      expect(board.instance_variable_get(:@game_over)).to eq(false)
      expect(board.instance_variable_get(:@player_x_selections)).to match_array([])
      expect(board.instance_variable_get(:@player_o_selections)).to match_array([])
    end
  end

  describe '#play_turn_and_swap' do
    it 'returns false if the selection is not valid' do
      expect(board.play_turn_and_swap(10)).to be_falsy
    end

    it 'returns false if the position is already taken and the player makes a selection' do
      board.instance_variable_set(:@board, [['x', 2, 3], [4, 5, 6], [7, 8, 9]])

      expect(board.play_turn_and_swap(1)).to be_falsy
    end

    it 'returns true if the postion is available' do
      expect(board.play_turn_and_swap(1)).to be_truthy
    end
  end
end
