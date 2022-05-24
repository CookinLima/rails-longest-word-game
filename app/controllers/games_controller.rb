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
    raise
  end
end
