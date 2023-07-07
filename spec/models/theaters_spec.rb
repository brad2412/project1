require "rails_helper"

RSpec.describe Theater, type: :model do
  describe "should show relationships" do
    it { should have_many(:movies) }
  end
end