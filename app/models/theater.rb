class Theater < ApplicationRecord
  has_many :movies

  def movie_count
    Movie.count
  end
end