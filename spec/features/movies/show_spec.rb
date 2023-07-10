require "rails_helper"

RSpec.describe "Movie show page" do
  let!(:theater1) { Theater.create!(name: "Riverside", open: true, review: 5) }
  let!(:theater2) { Theater.create!(name: "Parklane", open: true, review: 4) }

  let!(:movie1) { Movie.create!(name: "John Wick 4", rated_r: true, review: 5, theater: theater1) }
  let!(:movie2) { Movie.create!(name: "Spiderman", rated_r: false, review: 3, theater: theater2) }
  let!(:movie3) { Movie.create!(name: "Guardian's of the Galaxy", rated_r: false, review: 3, theater: theater2) }

  describe "show movie show page" do
    it "should show the movies' attributes" do
      visit "/movies/#{movie1.id}"

      expect(page).to have_content(movie1.name)
      expect(page).to have_content(movie1.rated_r)
      expect(page).to have_content(movie1.review)
      expect(page).to have_content(movie1.theater.name)

      expect(page).to_not have_content(movie2.name)
      expect(page).to_not have_content(movie2.rated_r)
      expect(page).to_not have_content(movie2.review)
      expect(page).to_not have_content(movie2.theater.name)

      expect(page).to_not have_content(movie3.name)
      expect(page).to_not have_content(movie3.rated_r)
      expect(page).to_not have_content(movie3.review)
      expect(page).to_not have_content(movie3.theater.name)
    end
  end
end






# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)