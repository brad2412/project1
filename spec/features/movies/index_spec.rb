require "rails_helper"

RSpec.describe "Movie index page" do
  let!(:theater1) { Theater.create!(name: "Riverside", open: true, review: 5) }
  let!(:theater2) { Theater.create!(name: "Parklane", open: true, review: 4) }

  let!(:movie1) { Movie.create!(name: "John Wick 4", rated_r: true, review: 5, theater: theater1) }
  let!(:movie2) { Movie.create!(name: "Spiderman", rated_r: false, review: 5, theater: theater2) }
  let!(:movie3) { Movie.create!(name: "Guardian's of the Galaxy", rated_r: false, review: 5, theater: theater1) }

  describe "Movie attributes" do
    it "should display the movie information" do
      visit "/movies"

      expect(page).to have_content("Movies")
      
      expect(page).to have_content("Name: #{movie1.name}")
      expect(page).to have_content("Rated_R: #{movie1.rated_r}")
      expect(page).to have_content("Review: #{movie1.review}")
      expect(page).to have_content("Theater: #{movie1.theater.name}")

      expect(page).to have_content("Name: #{movie2.name}")
      expect(page).to have_content("Rated_R: #{movie2.rated_r}")
      expect(page).to have_content("Review: #{movie2.review}")
      expect(page).to have_content("Theater: #{movie2.theater.name}")

      expect(page).to have_content("Name: #{movie3.name}")
      expect(page).to have_content("Rated_R: #{movie3.rated_r}")
      expect(page).to have_content("Review: #{movie3.review}")
      expect(page).to have_content("Theater: #{movie3.theater.name}")
    end
  end
end




# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)