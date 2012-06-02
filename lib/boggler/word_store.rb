class WordStore
  def initialize(store=Hash.new)
    @store = store
  end

  def add(word)
    @store[word] = true
    self
  end

  def is_word?(word)
    @store[word]
  end

  def is_prefix?(prefix)
    @store.keys.any? { |key| key.start_with?(prefix) }
  end
end
