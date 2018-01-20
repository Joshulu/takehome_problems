module Score
  class Spanish

    def self.mapping
      letter_to_score = {}
      %w(A E O S I U N L R T).each { |a| letter_to_score[a] = 1 }
      %w(C D G).each { |a| letter_to_score[a] = 2 }
      %w(B M P).each { |a| letter_to_score[a] = 3 }
      %w(F H V Y).each { |a| letter_to_score[a] = 4 }
      %w(J).each { |a| letter_to_score[a] = 6 }
      %w(K LL Ñ Q RR W X).each { |a| letter_to_score[a] = 8 }
      %w(Z).each { |a| letter_to_score[a] = 10 }

      letter_to_score
    end
  end
end
