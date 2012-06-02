require 'spec_helper'

describe WordStore do
  it 'allows a word to be added' do
    w = WordStore.new.add('test')
    w.is_word?('test').should be_true
    w.is_word?('nope').should be_false
  end

  it 'knows if something is a prefix for a word' do
    w = WordStore.new.add('test')
    w.is_prefix?('tes').should be_true
    w.is_prefix?('zzz').should be_false
  end
end
