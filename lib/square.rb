require_relative './cell'

class Square

  attr_reader :cells

  def initialize(length)
    @cells = []
    length.times {@cells << Cell.new}
  end

  def changeContent(position, newContent)
    checkCellContent(newContent)
    @cells[position].setContent(newContent)
  end

  def checkCellContent(newContent)
    @cells.each do |cell|
      raise 'Number is already in square' if cell.content === newContent
    end
  end

  def complete
    @cells.each do |cell|
      if cell.content.nil?
        return false
      end
    end
    true
  end

end