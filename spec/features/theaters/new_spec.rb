require "rails_helper"

RSpec.describe "/theaters/new" do
  it "should create a new theater" do
    visit "/theaters/new"

    fill_in(:name, with: "Riverside")
    fill_in(:open, with: true)
    fill_in(:review, with: 5)
    click_on "Create Theater"

    expect(current_path).to eq "/theaters"
    expect(page).to have_content("Riverside")
    expect(page).to have_content(true)
    expect(page).to have_content(5)

  end
end