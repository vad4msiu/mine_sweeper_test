require 'pry'
require './lib/board_map'

describe BoardMap do
  let(:size) { 0 }
  let(:mines) { [] }
  subject { BoardMap.new(size, mines) }

  describe '#to_s' do
    let(:size) { 4 }

    context 'no mines' do
      let(:mines) { [] }

      it 'return a foratted string map' do
        expect(subject.to_s).to eq("....\n....\n....\n....\n")
      end
    end

    context 'with mines' do
      let(:mines) { [[2, 3], [1, 1]] }

      it 'return a foratted string map' do
        expect(subject.to_s).to eq("111.\n1*1.\n1221\n.1*1\n")
      end
    end
  end
end
