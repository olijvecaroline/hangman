require 'spec_helper'


RSpec.describe Hangman do


before do
    #allow(random_word).to receive(:word).and_return("homebrew")
    @random_word = RandomWord.new()
    end

    describe "attributes" do
      it {is_expected.to respond_to(:array_word)}
      it {is_expected.to respond_to(:start)}
      it {is_expected.to respond_to(:print_playground)}
      it {is_expected.to respond_to(:turn)}
      it {is_expected.to respond_to(:input_check)}
      it {is_expected.to respond_to(:add_answer_to_answers)}
      it {is_expected.to respond_to(:letter_check)}
      it {is_expected.to respond_to(:duration)}
      it {is_expected.to respond_to(:hangman)}
      it {is_expected.to respond_to(:dead)}
      it {is_expected.to respond_to(:win)}
      it {is_expected.to respond_to(:ending)}
      it {is_expected.to respond_to(:play!)}
      it {is_expected.to respond_to(:bad_guesses_left)}
      it {is_expected.to respond_to(:letter_counter)}
      it {is_expected.to respond_to(:answer)}
      it {is_expected.to respond_to(:answers)}
      it {is_expected.to respond_to(:guess)}
    end


    describe "#start" do
      context "prints playground between beginning and end" do
        subject do
        Hangman.new
        end
          it "when new game prints an empty board" do
            (expect subject.bad_guesses_left).to eql(10)
          end
        end
    end

    describe "#print_playground" do
      context "prints playground between beginning and end" do
        subject do
        Hangman.new(:letter_counter => rand(1-9))
        end
            it "prints the status of the playing board " do
              (expect subject.bad_guesses_left).to be <=10
              (expect subject.bad_guesses_left).to be >0
            end
      end
    end

    describe "#add_answer_to_answers" do
      context "when valid input from the player" do
        subject do
        Hangman.new(:answer => "d",
                     :answers => ["a","b","c"])
        end
          it "adds the anwer only when valid" do
            (expect subject.add_answer_to_answers).to eql(["a","b","c","d"])
          end
      end
      context "when invalid input from the player" do
        subject do
        Hangman.new(:answer => "a",
                     :answers => ["a","b","c"])
        end
          it "adds the anwer only when valid" do
            (expect subject.add_answer_to_answers).to eql(["a","b","c"])
          end
      end
    end

end
