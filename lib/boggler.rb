require 'boggler/word_store'
require 'boggler/board'

class Boggler
  def initialize(word_store=WordStore.new)
    @word_store = word_store
  end

  def populate_word_store(words)
    words.each do |word|
      @word_store.add word
    end
  end

  # d a b
  # e f r
  # n t r
  #

  # grab a letter
  #   if its neighbor completes a word, add it to found words
  #   push each neighbor that's a prefix onto a queue
  #   pop top letter and check its neighbors
  #     if its neighbor completes a word, add it to found words
  #     push each neighbor onto the queue
  #
  #     
  #
  #     WordStore#add (to seed)
  #     WordStore#is_prefix? 
  #     WordStore#is_word? 
end
