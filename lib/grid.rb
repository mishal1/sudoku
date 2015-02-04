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
    @squareRoot = Math.sqrt(@size)
    @squares.each_slice(@squareRoot) do |rowOfSquares|
      checkRowOfSquares(rowOfSquares, squarePosition, cellPosition, cellContent)
    end
  end

  def checkRowOfSquares(rowOfSquares, squarePosition, cellPosition, cellContent)
    if rowOfSquares.include?(@squares[squarePosition])
      iterateThroughSquares(rowOfSquares, cellPosition, cellContent)
    end    
  end

  def iterateThroughSquares(rowOfSquares, cellPosition, cellContent)
    rowOfSquares.each do |squares|
      sliceSquares(squares, cellPosition, cellContent)
    end    
  end

  def sliceSquares(squares, cellPosition, cellContent)
    squares.cells.each_slice(@squareRoot) do |rowOfCells| 
      checkEachRow(rowOfCells, squares, cellPosition, cellContent)
    end    
  end

  def checkEachRow(rowOfCells, squares, cellPosition, cellContent)
    if rowOfCells.include?(squares.cells[cellPosition])
      checkIfNumberIsInRow(rowOfCells, cellContent)
    end    
  end

  def checkIfNumberIsInRow(rowOfCells, cellContent)
    rowOfCells.each do |cell|
      raise "Number is in row already" if cell.content === cellContent
    end    
  end

end