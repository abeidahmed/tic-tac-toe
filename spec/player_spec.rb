require_relative 'spec_helper'
require_relative '../lib/player'

RSpec.describe Player do
  describe '#initialize' do
    context 'when the player does not set the mark' do
      subject(:player) { Player.new('John') }

      it 'sets the @player and @mark instance variables' do
        expect(player.instance_variable_get(:@player)).to eq('John')
        expect(player.instance_variable_get(:@mark)).to eq('x')
      end
    end

    context 'when the player sets the mark' do
      subject(:player) { Player.new('John', 'o') }

      it 'can change the mark when player explicitly states' do
        expect(player.instance_variable_get(:@mark)).to eq('o')
      end
    end

    context 'when the player sets the mark to an unknown attribute' do
      subject(:player) { Player.new('John', 'a') }

      it 'will default to x' do
        expect(player.instance_variable_get(:@mark)).to eq('x')
      end
    end
  end
end
