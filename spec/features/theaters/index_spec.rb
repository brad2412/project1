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

  it "should display a link to create a new record" do
    visit "/theaters"

    expect(page).to have_link("New Theater")

    click_link "New Theater"
    expect(current_path).to eq("/theaters/new")

    
  end
end



# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.



