require "rails_helper"

RSpec.describe "shows theaters index page" do
  let!(:theater1) {Theater.create!(name: "Riverside", open: true, review: 5)}
  let!(:theater2) {Theater.create!(name: "Parklane", open: true, review: 4)}
  it "should show name of each theater" do

    visit "/theaters"
    expect(page).to have_content("Theaters")
    expect(page).to have_content("Name: #{theater1.name}")
    expect(page).to have_content("Name: #{theater2.name}")
  
  end
end



# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system