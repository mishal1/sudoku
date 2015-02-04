require_relative 'square'

class Grid

  attr_reader :squares

  def initialize(size)
    @size = size
    @squares = []
    size.times {@squares << Square.new(size)}
  end

  def changeContentOfCell(squarePosition, cellPosition, cellContent)
    checkRows(squarePosition, cellPosition, cellContent)
    @squares[squarePosition].changeContent(cellPosition, cellContent)
  end

  def checkRows(squarePosition, cellPosition, cellContent)
    squareRoot = Math.sqrt(@size)
    @squares.each_slice(squareRoot) do |rowOfSquares|
      if rowOfSquares.include?(@squares[squarePosition])
        rowOfSquares.each do |squares|
          squares.cells.each_slice(squareRoot) do |rowOfCells| 
            if rowOfCells.include?(squares.cells[cellPosition])
              rowOfCells.each do |cell|
                raise "Number is in row already" if cell.content === cellContent
              end
            end
          end
        end
      end
    end
  end

end