require 'sentence'

describe Sentence do
  shared_examples 'returns nil' do
    it 'returns nil' do
      expect(subject).to eq(nil)
    end
  end

  context '.last_word_length' do
    subject { described_class.last_word_length(sentence) }

    context 'when it is a valid sentence' do
      context 'when it is a multiple words sentence' do
        let(:sentence) { '   This is a     very good     example of a     valid sentence!!      ' }

        it 'returns the last word length correctly' do
          expect(subject).to eq(8)
        end
      end

      context 'when it is a single word sentence' do
        let(:sentence) { 'Thisisaverygoodexampleofavalidsentence' }

        it 'returns the word length correctly' do
          expect(subject).to eq(38)
        end
      end
    end

    context 'when it is an invalid sentence' do
      context 'when sentence is not a String' do
        let(:sentence) { 123 }

        it_behaves_like 'returns nil'
      end

      context 'when sentence is too long' do
        let(:sentence) { 'This is a very long sentence!! This is a very long sentence!! This is a very long sentence!! This is a very long sentence!! This is a very long sentence!! This is a very long sentence!!' }

        it_behaves_like 'returns nil'
      end

      context 'when sentence is an empty String' do
        let(:sentence) { '' }

        it_behaves_like 'returns nil'
      end
      
      context 'when sentence is nil' do
        let(:sentence) { nil }

        it_behaves_like 'returns nil'
      end
    end
  end
end