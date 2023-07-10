require "rails_helper"

RSpec.describe "Theaters_Movies index page" do
  let!(:theater1) { Theater.create!(name: "Riverside", open: true, review: 5) }
  let!(:theater2) { Theater.create!(name: "Parklane", open: true, review: 4) }

  let!(:movie1) { Movie.create!(name: "John Wick 4", rated_r: true, review: 5, theater: theater1) }
  let!(:movie2) { Movie.create!(name: "Spiderman", rated_r: false, review: 3, theater: theater2) }
  let!(:movie3) { Movie.create!(name: "Guardian's of the Galaxy", rated_r: true, review: 5, theater: theater1) }

  describe "Movie associated with the theater and all attributes" do
    it "should display the movie information" do
      visit "/theaters/#{theater1.id}/movies"

      expect(page).to have_content(movie1.name)
      expect(page).to have_content(movie1.rated_r)
      expect(page).to have_content(movie1.review)
      expect(page).to have_content(movie1.theater.name)

      expect(page).to_not have_content(movie2.name)
      expect(page).to_not have_content(movie2.rated_r)
      expect(page).to_not have_content(movie2.review)
      expect(page).to_not have_content(movie2.theater.name)

      expect(page).to have_content(movie3.name)
      expect(page).to have_content(movie3.rated_r)
      expect(page).to have_content(movie3.review)
      expect(page).to have_content(movie3.theater.name)
    end
  end
end





# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)