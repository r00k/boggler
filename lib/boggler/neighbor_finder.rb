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

  def row_neighbors
    if first_column?
      [@letters[row][1]]
    elsif last_column?
      [@letters[row][-2]]
    else
      [@letters[row][column - 1], @letters[row][column + 1]]
    end
  end

  def column_neighbors
    if top_row?
      [@letters[row + 1][column]]
    else middle_row?
      [@letters[row - 1][column]]
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

  private

  attr_accessor :row, :column, :board
end
