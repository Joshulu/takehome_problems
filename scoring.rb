# frozen_string_literal: true

class Scoring
  attr_reader :dictionary

  DICTIONARIES = {
    :english => { 1  => %w[A E I O U L N R S T],
                  2  => %w[D G],
                  3  => %w[B C M P],
                  4  => %w[F H V W Y],
                  5  => %w[K],
                  8  => %w[J X],
                  10 => %w[Q Z] },
    :spanish => { 1  => %w[A E I O U L N R S T],
                  2  => %w[C D G],
                  3  => %w[B M P],
                  4  => %w[F H V Y],
                  6  => %w[J],
                  8  => %w[K LL Ñ Q RR W X],
                  10 => %w[Z] }
  }

  def initialize(language = :english)
    @dictionary = configure(language)
  end

  def score_letter(letter)
    dictionary.fetch(letter, 0)
  end
  
  private

  def configure(language)
    DICTIONARIES.fetch(language)
                .each_with_object({}) do |(score, letters), dict|
                  letters.each do |letter|
                    dict[letter] = score
                  end
                end
  end
end
