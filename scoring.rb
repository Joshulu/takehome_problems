# frozen_string_literal: true

class Scoring

  attr_accessor :language, :scoring_hash

  def self.english_scoring_hash
    hash = {}
    %w[A E I O U L N R S T].each{|l| hash[l.to_sym] = 1 }
    %w[D G].each{|l| hash[l.to_sym] = 2 }
    %w[B C M P].each{|l| hash[l.to_sym] = 3 }
    %w[F H V W Y].each{|l| hash[l.to_sym] = 4 }
    %w[K].each{|l| hash[l.to_sym] = 5 }
    %w[J X].each{|l| hash[l.to_sym] = 8 }
    %w[Q Z].each{|l| hash[l.to_sym] = 10 }
    hash
  end

  def self.spanish_scoring_hash
    hash = {}
    %w[A E O S I U N L R T].each{|l| hash[l.to_sym] = 1 }
    %w[C D G].each{|l| hash[l.to_sym] = 2 }
    %w[B M P].each{|l| hash[l.to_sym] = 3 }
    %w[F H V Y].each{|l| hash[l.to_sym] = 4 }
    %w[J].each{|l| hash[l.to_sym] = 6 }
    %w[K LL Ñ Q RR W X].each{|l| hash[l.to_sym] = 8 }
    %w[Z].each{|l| hash[l.to_sym] = 10 }
    hash
  end

  SCORING_HASHES = {
    :english => self.english_scoring_hash,
    :spanish => self.spanish_scoring_hash,
  }.freeze

  def initialize(language, custom_scoring_hash = {})
    self.language = language
    if !custom_scoring_hash.empty?
      self.scoring_hash = custom_scoring_hash
    else
      self.scoring_hash = SCORING_HASHES[language]
    end
  end

  def score_letter(letter)
    scoring_hash.fetch(letter.upcase.to_sym, 0)
  end

  # def score_word(word)
  #   word.gsub!(/LL|RR/, '*')
  #   word.each_char.sum do |letter|
  #     score_letter(letter)
  #   end
  # end
end
