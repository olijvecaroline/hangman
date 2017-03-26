require_relative "random_word.rb"

class Hangman
attr_reader :array_word, :random_word, :answers

    def initialize
      @random_word = RandomWord.new.word.downcase
      @array_word = @random_word.split(//)
      @bad_guesses_left = 10
      @letter_counter = 0
      @answers=[]
      @playground =([" _ "]*(@array_word.length))
    end

    def start
      @playground.each {|x| print " __ " }
      puts " the unknown word has #{@array_word.length} letters"
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
            win
          else
            puts "Wrong, you get -1 chances \n\n"
            @bad_guesses_left -= 1
            turn
          end
      when ""
          puts "Don's hit enter, type a letter. "
          turn
      end
    end

    def input_checkII
      if !(%w(a b c d e f g h i j k l m n o p q r s t u  v w x  y z).include? @answer)
        puts " Please provide only letters, to quess the word type '!'. "
        turn
      elsif (@answers.include? @answer)
        puts" You already tried that letter before , choose another. "
        turn
      end
      @answer
    end




    def add_answer_to_answers
        @answers<<@answer
    end

    def letter_check
          if
            (@array_word.include? @answer)
            @array_word.each do |x|
              x.downcase
                    if
                      x == @answer
                      y = @array_word.index(x)
                      @playground[y] = @answer
                      @letter_counter += 1
                    end
                end

          else
            @bad_guesses_left -= 1
            puts "too bad"
          end
          @playground.each {|x| print " #{x.upcase} "}
          puts "these letters have been tried: #{@answers}"
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

    def win_without_guess
      if @letter_counter == @array_word.length
          win
      end
    end

    def win
        puts "Hing hang hong the hangman 's won'"
    end

    def play!
      puts "Hi from lib\hangman.rb!"

      start

      while (@bad_guesses_left > 0) && (@letter_counter != @array_word.length)  do

      turn
      input_check
      input_checkII
      add_answer_to_answers
      letter_check

      puts "bad_guesses_left: #{@bad_guesses_left}"
      puts "#{(@array_word.length)-@letter_counter} letters to go"
      end

      win_without_guess
      dead
    end


end


game = Hangman.new
game.play!
