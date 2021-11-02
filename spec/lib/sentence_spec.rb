require 'sentence'

describe Sentence do
  shared_examples 'returns the right response' do |response|
    it { expect(subject).to eq(response) }
  end

  context '.last_word_length' do
    subject { described_class.new.last_word_length(sentence) }

    context 'when it is a valid sentence' do
      context 'when it is a multiple words sentence' do
        let(:sentence) { '   This is a  @@@ #$$  very good   ()()((()))  example of a     valid sentence  !!      ' }

        it_behaves_like 'returns the right response', 8
      end

      context 'when it is a single word sentence' do
        let(:sentence) { 'Thisisaverygoodexampleofavalidsentence' }

        it_behaves_like 'returns the right response', 38
      end
    end

    context 'when it is an invalid sentence' do
      context 'when sentence is not a String' do
        let(:sentence) { 123 }

        it_behaves_like 'returns the right response', StandardError.new('Needs to be a String!')
      end

      context 'when sentence is too long' do
        let(:sentence) { 'This is a very long sentence!! This is a very long sentence!! This is a very long sentence!! This is a very long sentence!! This is a very long sentence!! This is a very long sentence!!' }

        it_behaves_like 'returns the right response', StandardError.new('Sentence is too long!')
      end

      context 'when sentence is an empty String' do
        let(:sentence) { '     ' }

        it_behaves_like 'returns the right response', StandardError.new('Sentence can not be an empty String!')
      end

      context 'when sentence has no letters' do
        let(:sentence) { '%%%%% $$$$ #####' }

        it_behaves_like 'returns the right response', StandardError.new('Invalid sentence!')
      end
    end
  end
end