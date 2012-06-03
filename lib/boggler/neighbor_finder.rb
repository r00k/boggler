class NeighborFinder
  def initialize(letters, row, column)
    @letters = letters
    @row = row
    @column = column
  end

  def find
    rows = row_neighbors
    cols = column_neighbors
    diags = diagonal_neighbors
    rows + cols + diags
  end

  private

  def row_neighbors
    if first_column?
      [letter_to_right]
    elsif last_column?
      [letter_to_left]
    else
      [letter_to_left, letter_to_right]
    end
  end

  def column_neighbors
    if top_row?
      [letter_below]
    elsif middle_row?
      [letter_above, letter_below]
    end
  end

  def diagonal_neighbors
    [].tap do |neighbors|
      if not_first_column?
        neighbors << @letters[row + 1][column - 1]
      end

      if not_last_column?
        neighbors << @letters[row + 1][column + 1]
      end
    end
  end

  def letter_above
    @letter[row][column - 1]
  end

  def letter_below
    @letters[row + 1][column]
  end

  def first_column?
    column == 0
  end

  def last_column?
    column == @letters.size - 1
  end

  def top_row?
    row == 0
  end

  def middle_row?
    row > 0 && row < @letters.size - 1
  end

  def not_first_column?
    column > 0
  end

  def not_last_column?
    column < @letters.size - 1
  end

  def letter_to_right
    @letters[row][column + 1]
  end

  def letter_to_left
    @letters[row][column - 1]
  end

  attr_accessor :row, :column, :board
end
