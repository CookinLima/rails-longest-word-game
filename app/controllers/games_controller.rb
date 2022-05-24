require "json"
require "open-uri"

class GamesController < ActionController::Base
  def new
    @letters = []
    arr = ('a'..'z').to_a
    10.times {
      # byebug
      @letters << arr.shuffle[0]
    }
  end

  def score
    # Get letters from game
    @letters = params[:name]
    check_letters = params[:name].split()
    # Letters from user answer should also exist inside @letters
    @word = params[:word]
    check_word = params[:word].split("")
    check_word.each do |letter|
      # If letters don't exist, post @no_match
      if check_letters.include?(letter) == false
        @no_match = "Sorry but #{@word} can't be built out of #{@letters}"
      end
    end
    # Check compare word with le wagon dictionary
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)
    if @user["found"] == true
      @match = "Congratulations! #{@word} is a valid English word!"
    else
      @no_match_word = "Sorry but #{@word} does not seem to be a valid English word..."
    end
    # @data = JSON.parse(open(url).read)
    # If no match, post @no_match
    # If match, post @match
  end

end

