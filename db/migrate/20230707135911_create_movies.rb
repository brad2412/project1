class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.boolean :rated_r
      t.integer :review

      t.timestamps
    end
  end
end
