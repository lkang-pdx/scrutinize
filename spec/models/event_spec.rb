require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user) }
  let(:registered_application) { create(:registered_application) }
  let(:event) { Event.create!(name: 'Event Name', registered_application: registered_application) }

  it { is_expected.to belong_to(:registered_application) }

  describe "attributes" do
    it "has a name attribute" do
      expect(event).to have_attributes(name: 'Event Name')
    end
  end
end
