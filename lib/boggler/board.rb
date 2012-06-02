class Board
  def initialize(letters)
    @letters = letters
  end

  def to_s
    @letters.join("\n")
  end
end
