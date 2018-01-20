module Score
  class English

    def self.mapping
      letter_to_score = {}
      %w(E A I O N R T L S U).each { |a| letter_to_score[a] = 1 }
      %w(D G).each { |a| letter_to_score[a] = 2 }
      %w(B C M P).each { |a| letter_to_score[a] = 3 }
      %w(F H V W Y).each { |a| letter_to_score[a] = 4 }
      %w(K).each { |a| letter_to_score[a] = 5 }
      %w(J X).each { |a| letter_to_score[a] = 8 }
      %w(Q Z).each { |a| letter_to_score[a] = 10 }

      letter_to_score
    end

  end
end
