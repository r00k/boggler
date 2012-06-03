class NeighborFinder
  def initialize(letters, row, column)
    @letters = letters
    @row = row
    @column = column
  end

  def find
    row_neighbors + column_neighbors + diagonal_neighbors
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
    else
      [letter_above]
    end
  end

  def diagonal_neighbors
    [].tap do |neighbors|
      if has_upper_left_diagonal?
        neighbors << upper_left_diagonal
      end

      if has_upper_right_diagonal?
        neighbors << upper_right_diagonal
      end

      if has_bottom_left_diagonal?
        neighbors << bottom_left_diagonal
      end

      if has_bottom_right_diagonal?
        neighbors << bottom_right_diagonal
      end
    end
  end

  def has_bottom_right_diagonal?
    row + 1 <= max_board_dimension && column + 1 <= max_board_dimension
  end

  def bottom_right_diagonal
    @letters[row + 1][column + 1]
  end

  def has_bottom_left_diagonal?
    row + 1 <= max_board_dimension && column - 1 >= 0
  end

  def bottom_left_diagonal
    @letters[row + 1][column - 1]
  end

  def has_upper_right_diagonal?
    row - 1 >= 0 && column + 1 <= max_board_dimension
  end

  def upper_right_diagonal
    @letters[row - 1][column + 1]
  end

  def has_upper_left_diagonal?
    row - 1 >= 0 && column - 1 >= 0
  end

  def upper_left_diagonal
    @letters[row - 1][column - 1]
  end

  def letter_above
    @letters[row - 1][column]
  end

  def letter_below
    @letters[row + 1][column]
  end

  def first_column?
    column == 0
  end

  def last_column?
    column == max_board_dimension
  end

  def top_row?
    row == 0
  end

  def middle_row?
    row > 0 && row < max_board_dimension
  end

  def not_first_column?
    column > 0
  end

  def not_last_column?
    column < max_board_dimension
  end

  def letter_to_right
    @letters[row][column + 1]
  end

  def letter_to_left
    @letters[row][column - 1]
  end

  def max_board_dimension
    @letters.size - 1
  end

  attr_accessor :row, :column, :board
end
