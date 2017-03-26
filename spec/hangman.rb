require 'spec_helper'


describe HangMan do

before do
    #allow(random_word).to receive(:word).and_return("homebrew")
    @random_word = RandomWord.new()
    end

    describe "attributes" do
      it {is_expected.to respond_to(:array_word)}
      it {is_expected.to respond_to(:playground)}
      it {is_expected.to respond_to(:bad_guesses_left)}
      it {is_expected.to respond_to(:letter_counter)}
      it {is_expected.to respond_to(:answers)}
      it {is_expected.to respond_to(:guess)}
    end

    describe "#start" do
      before do Hangman(:letter_counter => 0) end
        it "when new game prints an empty board" do
          (expect bad_quesses_left).to eql(10)
        end
    end

    describe "#print_playground" do
      before do HangMan(:letter_counter => rand(1-9))end
        context "prints playground between beginning and end" do
          it "prints the status of the playing board " do
            (expect bad_quesses_left).to be (< 10)
            (expect bad_guesses_left).to be (> 0)
          end
        end
    end

end
