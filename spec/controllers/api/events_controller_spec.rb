require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:registered_application) { create(:registered_application) }

  describe "POST create" do
    before do
     controller.request.env['HTTP_ORIGIN'] = registered_application.url
     post :create, params: { event: { name: "About Page Load" } }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns json content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "creates a event with the correct attributes" do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['name']).to eq("About Page Load")
    end
 end

end
