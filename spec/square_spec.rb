require 'square'

describe Square do

  let(:cell)   {double :cell}
  let(:square) {Square.new(4)}

  def fillSquares
    position = 0
    content = 1
    4.times do
      square.changeContent(position, content)
      position+=1
      content+=1
    end
  end
  
  it 'should have cells when initialized' do
    expect(square.cells).not_to be_nil
  end

  it 'should be able to set up the square with cells' do
    expect(square.cells[0].is_a?(Cell)).to be true
  end

  it 'should be able to change the content of the cells' do
    expect(square.changeContent(0, 1)).to eq 1
    expect(square.cells[0].content).to eq 1
  end

  it 'should not be able to change the content of a cell if the number is already in the square' do
    square.changeContent(0, 1)
    expect{square.changeContent(1,1)}.to raise_error(RuntimeError)
  end

  it 'should know when the grid is not complete' do
    expect(square.complete).to be false
  end

  it 'should know when the grid is complete' do
    fillSquares
    expect(square.complete).to be true
  end

end