require 'grid'

describe Grid do

  let(:grid) {Grid.new(4)}
  
  it 'should have squares when initialized' do
    expect(grid.squares).not_to be_nil
  end

  it 'should be able to setup squares' do
    expect(grid.squares[0].is_a?(Square)).to be true
  end

  it 'shoulde be able to change the content of a cell in a square' do
    expect(grid.changeContentOfCell(0,0,1)).to eq 1
  end

  it 'should not be able to change the content of a cell if that number is in the same row' do
    grid.changeContentOfCell(0,0,1)
    expect(grid.squares[0].cells[0].content).to eq 1
    expect{grid.changeContentOfCell(1,0,1)}.to raise_error(RuntimeError)
  end

  it 'should be able to change the conent of a cell if that number is not in the row already' do
    grid.changeContentOfCell(0,0,1)
    expect{grid.changeContentOfCell(1,2,1)}.not_to raise_error
  end

end