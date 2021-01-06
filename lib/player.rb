class Player
  PLAYER_MARKS = %w[x o].freeze

  attr_reader :mark, :name

  def initialize(name, mark = 'x')
    @name = name
    @mark = assign_or_fallback_to(mark)
  end

  private

  def assign_or_fallback_to(mark)
    PLAYER_MARKS.include?(mark.downcase) ? mark : 'x'
  end
end
