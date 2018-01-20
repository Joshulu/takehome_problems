# frozen_string_literal: true

require_relative 'score/english'
require_relative 'score/spanish'
require 'pry'

class Scoring

  attr_reader :mapping

  def initialize(language = :english)
    @mapping = get_mapping(language)
  end

  def score_letter(letter)
    mapping[letter.upcase]
  end

  private

  def get_mapping(language)
    mapping_class = Object.const_get("Score::#{language.to_s.capitalize}")
    mapping_class.mapping
  end
end
