require "rails_helper"

RSpec.describe "shows theaters index page" do
  let!(:theater1) {Theater.create!(name: "Riverside", open: true, review: 5, created_at: Date.today - 2.day)}
  let!(:theater2) {Theater.create!(name: "Parklane", open: true, review: 4, created_at: Date.today - 1.day)}
  it "should show name of each theater" do
    visit "/theaters"

    expect(page).to have_content("Theaters")
    expect(page).to have_content("Name: #{theater1.name}")
    expect(page).to have_content("Name: #{theater2.name}")  
  end

  it "should display theaters by most recently created" do
    visit "/theaters"
    expect(page).to have_content("Created At: #{theater2.created_at}")
    expect(page).to have_content("Created At: #{theater1.created_at}")
    # expect(theater2).to appear_before(theater1)

  end
end



