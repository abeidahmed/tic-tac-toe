require 'byebug'
require_relative 'spec_helper'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

RSpec.describe Game do
  let(:player_x) { Player.new('John', 'x') }
  let(:player_o) { Player.new('Maggie', 'o') }
  let(:board) { Board.new }
  let(:game) { Game.new(player_x, player_o) }

  describe '#initialize' do
    it 'sets the necessary instance variables' do
      expect(game.instance_variable_get(:@player_x)).to eq(player_x)
      expect(game.instance_variable_get(:@player_o)).to eq(player_o)
      expect(game.instance_variable_get(:@board)).to be_a(Board)
      expect(game.instance_variable_get(:@total_rounds)).to be_zero
      expect(game.instance_variable_get(:@game_over)).to eq(board.game_over)
      expect(game.instance_variable_get(:@someone_won)).to eq(false)
    end
  end

  describe '#current_turn_to_play' do
    it 'returns x turn to play when player_1 should play' do
      expect(game.current_turn_to_play).to eq("John's turn (x)")
    end

    # xit 'returns o turn to play when player_2 should play' do
    #   expect(game.current_turn_to_play).to eq("Maggie's turn (o)")
    # end
  end

  describe '#make_play' do
    it 'should increment @total_rounds by 1' do
      game.make_play(1)

      expect(game.instance_variable_get(:@total_rounds)).to eq(1)
    end
  end
end
