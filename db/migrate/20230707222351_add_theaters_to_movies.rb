class AddTheatersToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :theater, null: false, foreign_key: true
  end
end
