require 'rspec'
require './day_01_b.rb'

RSpec.describe Day01B do
  include Day01B

  let(:filename) { 'example_b.txt' }

  context 'part2' do
    subject { part2(filename) }

    it 'returns the expected solution' do
      expect(subject).to eq(281)
    end

    context 'with puzzle input' do
      let(:filename) { 'input.txt' }

      it 'returns the expected solution' do
        expect(subject).to eq(nil)
      end
    end
  end
end

