require_relative "random_word.rb"

class Hangman
attr_reader :random_word, :answer, :array_word

    def initialize
      @random_word = RandomWord.new.word.downcase
      @array_word = @random_word.split(//)
      @playground =([" _ "]*(@array_word.length))
      @bad_guesses_left = 2
      @letter_counter = 0
      @answers=[]
    end

    def start
      @playground.each {|x| print " __ " }
      puts " the unknown word has #{@array_word.length} letters"
    end

    def print_playground
      @playground.each {|x| print " #{x.upcase} "}
    end

    def turn
      print "Give us a letter, or, to guess the word, type '!': "
      @answer = gets.chomp.chr.downcase
    end

      def input_check
        case @answer
        when "!"
          print " ! : "
          @guess = gets.chomp.downcase
            if
              @guess == @random_word
              ending
            else
              print "Wrong, you get -1 chances \n\n"
              @bad_guesses_left -= 1
              turn
            end
        when ""
            print "Don's hit enter, type a letter. "
            turn
          #when (@answers.include? @answer) = true
          #puts @answers
          #print " You already tried that letter before , choose another. "
          #turn
        when
            !(%w(a b c d e f g h i j k l m n o p q r s t u  v w x  y z).include? @answer)
            print " Please provide only letters, to quess the word type '!'. "
        else
          add_answer_to_answers
        end
      end

  def add_answer_to_answers
    @answers<<@answer
  end

  def letter_check
      if (@array_word.include? @answer)
        @array_word.each do |x|
          x.downcase
              f x == @answer
                y = @array_word.index(x)
                @playground[y] = @answer
                @letter_counter += 1
            end
      else
        @bad_guesses_left -= 1
        puts "too bad"
      end
  end

    def duration
      while (@bad_guesses_left > 0) && (@letter_counter != @array_word.length)  do
        turn
        input_check
        letter_check
        print_playground
        puts "bad_guesses_left: #{@bad_guesses_left}"
        puts  "#{(array_word.length)-@letter_counter} letters to go"
      end
    end

    def hangman
      print "
      \t\t\t\t\ _______
      \t\t\t\t\|
      \t\t\t\tO\s\s\s\t|
      \t\t\t\t|\s\t|
      \t\t\t\s\s\s\s\s\s\s/| \s\t|
      \t\t\t\t\t|
      \t\t\t\t\t|
      \t\t\t\t\t|
      \t\t\t\t\s\s\s\_____|_____
      "
    end

    def dead
      if @bad_guesses_left == 0
        hangman
        puts "You are dead, the word was #{@random_word.upcase}, do you want to play again ?"
      end
    end

    def win
      if @letter_counter == @array_word.length
        puts "Hing hang hong the hangman 's won'"
      end
    end

    def ending
      win
      dead
    end

    def play!
      puts "Hi from lib\hangman.rb!"
      start
      duration
      ending
    end
end


game = Hangman.new
game.play!
