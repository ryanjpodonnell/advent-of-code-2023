require 'rspec'
require './day_01.rb'

RSpec.describe Day01 do
  include Day01

  let(:filename) { 'example.txt' }

  context 'part1' do
    subject { part1(filename) }

    it 'returns the expected solution' do
      expect(subject).to eq(142)
    end

    context 'with puzzle input' do
      let(:filename) { 'input.txt' }

      it 'returns the expected solution' do
        expect(subject).to eq(nil)
      end
    end
  end
end

