require 'cell'

describe Cell do

  let(:cell) {Cell.new}
  
  it 'should initialize with a nil value' do
    expect(cell.content).to eq nil
  end

  it 'the conent should be able to be changed' do
    cell.setContent(1)
    expect(cell.content).to eq 1
  end

  it 'the content should have a default limit' do
    expect(cell.limit).to eq 9
  end

  it 'the limit of the content of the cells should be able to change' do
    cell.setLimit(4)
    expect(cell.limit).to eq 4
  end

  it 'the content of the cell should be a number' do
    cell.setContent("something")
    expect(cell.content).to eq nil
  end

  it 'the content of a cell should be a number and under the limit' do
    cell.setContent(10)
    expect(cell.content).to eq nil
  end

end