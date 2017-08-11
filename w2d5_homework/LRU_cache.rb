class LRUCache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    else
      if @cache.count > @size
        @cache.shift
      end
      @cache.push(el)
    end
    @cache
  end

  def show
    @cache.dup
  end

end
