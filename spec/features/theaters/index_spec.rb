require "rails_helper"

RSpec.describe "shows theaters index page" do
  it "should show name of each theater" do
    theater_1 = Theater.create!(name: "Riverside", open: true, review: 5)

    visit "/theaters"
  end
end



# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system