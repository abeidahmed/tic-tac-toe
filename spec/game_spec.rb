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
      expect(game.instance_variable_get(:@player_x)).to eq('John')
      expect(game.instance_variable_get(:@player_o)).to eq('Maggie')
      expect(game.instance_variable_get(:@board)).to be_a(Board)
      expect(game.instance_variable_get(:@total_rounds)).to be_zero
      expect(game.instance_variable_get(:@game_over)).to eq(board.game_over)
      expect(game.instance_variable_get(:@someone_won)).to eq(false)
      expect(game.instance_variable_get(:@show_message)).to eq('')
    end
  end

  describe '#current_turn_to_play' do
    it 'returns x turn to play when player_1 should play' do
      expect(game.current_turn_to_play).to match(/John/)
    end
  end

  describe '#make_play' do
    it 'should increment @total_rounds by 1' do
      game.make_play(1)

      expect(game.instance_variable_get(:@total_rounds)).to eq(1)
    end

    it 'should set @game_over to true and @someone_won to false if it was a draw' do
      game.instance_variable_set(:@total_rounds, 8)
      game.make_play(1)

      expect(game.instance_variable_get(:@game_over)).to be_truthy
      expect(game.instance_variable_get(:@someone_won)).to be_falsy
    end
  end

  describe '#win_message' do
    it 'returns the player name who won' do
      expect(game.win_message(true)).to match(/Maggie/)
    end

    it 'returns nil if arg is false' do
      expect(game.win_message(false)).to be_nil
    end
  end
end
