class Cell

  attr_reader :limit, :content

  def initialize
    @limit = 9
  end

  def setContent(number)
    @content = number if number.is_a?(Integer) && number <= @limit
  end

  def numberLimit
    @limit
  end

  def setLimit(number)
    @limit = number
  end

end