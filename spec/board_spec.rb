require 'spec_helper'

describe Board do
  it 'can print a representation of itself' do
    b = Board.new([['a b c'], ['d e f']])
    b.to_s.should == "a b c\nd e f"
  end
end
