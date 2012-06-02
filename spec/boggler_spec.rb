require 'spec_helper'

describe Boggler do
  describe '#initialize' do
    it 'instantiates a WordStore' do
      WordStore.should_receive :new

      Boggler.new
    end
  end


  describe '#populate_word_store' do
    it 'adds all passed in words to the WordStore' do
      WordStore.any_instance.should_receive(:add).with('dog')
      WordStore.any_instance.should_receive(:add).with('cat')
      b = Boggler.new
      b.populate_word_store(['dog', 'cat'])
    end
  end
  

  describe '#solve' do
  end
end
