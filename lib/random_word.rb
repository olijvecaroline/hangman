class RandomWord
  attr_reader :word

  WORDS = %w(combustible combat combatant come comedian comet comfortable colossal colour colonial colonel colon collywobbles colloquial collision colliery collier collect collateral collate collar programming monkeybusiness rubyesque styleguide)

  def initialize
    @word = WORDS.sample
  end

  def answer
    puts " #{@word} "
  end

  def positions_for
    (@word.length).times do print "[] " end
  end
end
