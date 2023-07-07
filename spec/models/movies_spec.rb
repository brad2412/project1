require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "should show relationships" do
    it { should belong_to (:theater) }
  end
end