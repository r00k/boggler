require_relative 'neighbor_finder'

class Board
  # Initialize with an array of arrays.
  #
  # A board like
  #   a b c
  #   d e f
  #   g h i
  #
  # Is initialized thusly:
  #   Board.new([%w(a b c),
  #              %w(d e f),
  #              %w(g h i)])
  #
  # Assumes a square (NxN) board.
  def initialize(letters)
    @letters = letters
  end

  # 0, 0 is the top left corner.
  def letter_at(row, column)
    @letters[row][column]
  end

  def neighbors_of(row, column)
    NeighborFinder.new(@letters, row, column).find
  end

  def to_s
    rows_as_strings = @letters.map { |row| row.join(' ') }
    rows_as_strings.join("\n")
  end

  def print
    puts to_s
  end
end
