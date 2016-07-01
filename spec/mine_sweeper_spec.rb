require 'pry'
require './lib/mine_sweeper'

describe MineSweeper do
  describe 'argument validations' do
    it 'raises an exception if wrong level is given' do
      expect { MineSweeper.new 'invalid' }.to raise_error ArgumentError
    end

    it 'raises an exception if no level is given' do
      expect { MineSweeper.new nil }.to raise_error ArgumentError
    end
  end

  describe 'board rendering' do
    shared_examples "successfully renders" do
      it 'successfully renders' do
        ms = MineSweeper.new board_type

        ms.render buffer
        expect(buffer.string).to eq(expected_result)
      end
    end

    let(:buffer) { StringIO.new '' }

    context "with the empty board" do
      let(:board_type) { 'empty'}
      let(:expected_result) { "...\n...\n...\n" }

      include_examples "successfully renders"
    end

    context "with the easy board" do
      let(:board_type) { 'easy'}
      let(:expected_result) { "111\n1*1\n111\n" }

      include_examples "successfully renders"
    end

    context "with the medium board" do
      let(:board_type) { 'medium'}
      let(:expected_result) { "111..\n1*21.\n13*2.\n.3*3.\n.2*2.\n" }

      include_examples "successfully renders"
    end

    context "with the hard board" do
      let(:board_type) { 'hard'}
      let(:expected_result) {
        "........\n........\n........\n........\n....1232\n....2***\n....3*8*\n....2***\n"
      }

      include_examples "successfully renders"
    end
  end
end
