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
