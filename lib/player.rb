class Player
  PLAYER_MARKS = %w[x o].freeze

  attr_reader :mark, :player

  def initialize(player, mark = 'x')
    @player = player
    @mark = assign_or_fallback_to(mark)
  end

  private

  def assign_or_fallback_to(mark)
    PLAYER_MARKS.include?(mark.downcase) ? mark : 'x'
  end
end
