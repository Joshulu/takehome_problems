# frozen_string_literal: true

require_relative 'scoring'

RSpec.describe Scoring do
  describe '#score_letter' do
    context 'in English' do
      subject { described_class.new(:english) }

      %w[A E I O U L N R S T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 1
        end
      end

      %w[D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 2
        end
      end

      %w[B C M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(subject.score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V W Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(subject.score_letter(letter))
            .to eq 4
        end
      end

      %w[K].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(subject.score_letter(letter))
            .to eq 5
        end
      end

      %w[J X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(subject.score_letter(letter))
            .to eq 8
        end
      end

      %w[Q Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
            .to eq 10
        end
      end

      context 'letters are lowercase' do
        %w[a e i o u l n r s t].each do |letter|
          it "scores a #{letter} as 1 point" do
            expect(subject.score_letter(letter))
              .to eq 1
          end
        end

        %w[d g].each do |letter|
          it "scores a #{letter} as 2 point" do
            expect(subject.score_letter(letter))
              .to eq 2
          end
        end

        %w[b c m p].each do |letter|
          it "scores a #{letter} as 3 point" do
            expect(subject.score_letter(letter))
              .to eq 3
          end
        end

        %w[f h v w y].each do |letter|
          it "scores a #{letter} as 4 point" do
            expect(subject.score_letter(letter))
              .to eq 4
          end
        end

        %w[k].each do |letter|
          it "scores a #{letter} as 5 point" do
            expect(subject.score_letter(letter))
              .to eq 5
          end
        end

        %w[j x].each do |letter|
          it "scores a #{letter} as 8 point" do
            expect(subject.score_letter(letter))
              .to eq 8
          end
        end

        %w[q z].each do |letter|
          it "scores a #{letter} as 10 point" do
            expect(subject.score_letter(letter))
              .to eq 10
          end
        end
      end
    end

    context 'in Spanish' do
      subject { described_class.new(:spanish) }

      %w[A E O S I U N L R T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 1
        end
      end

      %w[C D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 2
        end
      end

      %w[B M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(subject.score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(subject.score_letter(letter))
            .to eq 4
        end
      end

      %w[J].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(subject.score_letter(letter))
            .to eq 6
        end
      end

      %w[K LL Ñ Q RR W X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(subject.score_letter(letter))
            .to eq 8
        end
      end

      %w[Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
            .to eq 10
        end
      end
    end

    context 'custom scoring' do
      subject { described_class.new(:klingon, {:A => 100, :B => 50}) }

      %w[A].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 100
        end
      end

      %w[B].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 50
        end
      end
    end
  end

  describe '#score_word' do
    it 'scores a word in english' do
      subject = Scoring.new(:english)
      expect(subject.score_word('STRRUVE')).to eq(10)
    end

    it 'scores a word in spanish' do
      subject = Scoring.new(:spanish)
      expect(subject.score_word('STRRUVE')).to eq(16)
    end
  end
end
