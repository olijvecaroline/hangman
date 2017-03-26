require 'spec_helper'


describe HangMan do

before do
    allow(random_word).to receive(:word).and_return("homebrew")

    let(answer) {A}
    let(guess) {guess}
    let @array_word = @random_word.split(//)
    let @playground =([" _ "]*(@array_word.length))
    let @bad_guesses_left =
    let @letter_counter = 0
    let @answers=[]

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
  end

  describe "#print_playground" do
    before do HangMan(:letter_counter => rand(1-9))
      context "prints playground between beginning and end" do
        it "prints the status of the playing board " do
          (expect bad_quesses_left).to be (< 10)
          (expect bad_guesses_left).to be (> 0)
      end
    end
  end

  describe "#turn" do
    before do @anwer = "AAs" end
      it "turns player input into a downcase string of one letter" do (expect @answer).to eq("a") end
    end
  end

  describe "#input_check" do

    #context "when the imput is !"
      #before do @answer = ! end
        #expect(@guess

        #context "check the quess against the word and route to winner or turn" do
          it "checks the input on equality with the word" do
            (expect (guess == random_word).to eq true

            contex "succes" do
              let(true)
                it "routes to #winner" do
                  (expect game.input_check).to eq(winner)
                end
            end

            context "failure" do
              let(@guess) {random_word}
                it "routes to turn" do
                  expect(game.input_check).to eq(turn)
                end
                it " deducts 1 from possible attempts" do
                  expect()
                end
            end
          end
        end
      end
