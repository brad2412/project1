require "rails_helper"

RSpec.describe "theaters show page" do
  let!(:theater1) {Theater.create!(name: "Riverside", open: true, review: 5)}
  let!(:theater2) {Theater.create!(name: "Parklane", open: false, review: 4)}

  let!(:movie1) { Movie.create!(name: "John Wick 4", rated_r: true, review: 5, theater: theater1) }
  let!(:movie2) { Movie.create!(name: "Spiderman", rated_r: false, review: 3, theater: theater2) }
  let!(:movie3) { Movie.create!(name: "Guardian's of the Galaxy", rated_r: false, review: 3, theater: theater2) }

  describe "theaters attribues" do
    it "should display description of the theater" do
      visit "/theaters/#{theater1.id}"
      expect(page).to have_content(theater1.name)
      expect(page).to have_content(theater1.open)
      expect(page).to have_content(theater1.review)
  
      expect(page).to_not have_content(theater2.name)
      expect(page).to_not have_content(theater2.open)
      expect(page).to_not have_content(theater2.review)
  
    end

    it "should display a count of movies associated with the theater" do
      visit "/theaters/#{theater2.id}"
      expect(page).to have_content(theater2.movie_count)
      
      visit "/theaters/#{theater1.id}"
      expect(page).to have_content(theater1.movie_count)
    end
  end

  describe "theater movie index link" do
    it "the link should take you to the movie page" do

      visit "/theaters/#{theater1.id}"
      expect(page).to have_link("View this Theater's Movies")

      click_link "View this Theater's Movies"
      expect(current_path).to eq("/theaters/#{theater1.id}/movies")
    end
  end
end

# User Story 10, Parent Child Index Link

# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')