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
  end
end
