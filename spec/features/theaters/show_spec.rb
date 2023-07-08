require "rails_helper"

RSpec.describe "theaters show page" do
  let!(:theater1) {Theater.create!(name: "Riverside", open: true, review: 5)}
  let!(:theater2) {Theater.create!(name: "Parklane", open: false, review: 4)}

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
  end
end