require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:registered_application) { create(:registered_application) }

  it { is_expected.to have_many(:events) }

  describe "attributes" do
    it "has a name and url attribute" do
      expect(registered_application).to have_attributes(name: registered_application.name, url: registered_application.url)
    end
  end
end
