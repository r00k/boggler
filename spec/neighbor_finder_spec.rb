require 'spec_helper'

describe NeighborFinder do
  describe '#neighbors_of' do
    let(:board) { Board.new([%w(a b c),
                             %w(d e f),
                             %w(g h i)]) }

    it 'returns the neighbors of a specified point' do
      board.neighbors_of(0,0).should == ['b', 'd', 'e']
      board.neighbors_of(0,1).should == ['a', 'c', 'e', 'd', 'f']
      board.neighbors_of(0,2).should == %w(b f e)

      board.neighbors_of(1,0).should == %w(e a g b h)
      board.neighbors_of(1,1).should == %w(d f b h a c g i)
      board.neighbors_of(1,2).should == %w(e c i b h)

      board.neighbors_of(2,0).should == %w(h d e)
      board.neighbors_of(2,1).should == %w(g i e d f)
      board.neighbors_of(2,2).should == %w(h f e)
    end
  end
end
