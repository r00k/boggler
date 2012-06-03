require 'spec_helper'

describe Board do
  it 'can print a representation of itself' do
    b = Board.new([%w(a b c), %w(d e f)])
    b.to_s.should == "a b c\nd e f"
  end
end

describe '#letter_at' do
  it 'returns the letter at the given position' do
    b = Board.new([%w(a b c), %w(d e f)])

    b.letter_at(0, 0).should == 'a'
    b.letter_at(0, 1).should == 'b'
    b.letter_at(0, 2).should == 'c'

    b.letter_at(1, 0).should == 'd'
    b.letter_at(1, 1).should == 'e'
    b.letter_at(1, 2).should == 'f'
  end
end

describe '#neighbors_of' do
  let(:board) { Board.new([%w(a b c),
                           %w(d e f),
                           %w(g h i)]) }

  it 'returns neighbors for a letter in the top left' do
    board.neighbors_of(0,0).should == ['b', 'd', 'e']
  end

  it 'returns neighbors for a letter in the top middle' do
    board.neighbors_of(0,1).should == ['a', 'c', 'e', 'd', 'f']
  end

  it 'returns neighbors for a letter on the top right' do
    board.neighbors_of(0,2).should == %w(b f e)
  end

  # it 'returns neighbors for a second-row first-column letter' do
  #   board.neighbors_of(1,0).should == %w(e a g b h)
  # end
end
