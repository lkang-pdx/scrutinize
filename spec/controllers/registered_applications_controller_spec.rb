require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:registered_application) { create(:registered_application) }
  let(:registered_application2) { create(:registered_application) }

  before do
    sign_in user
  end

  describe "GET index" do
    it "returns http success" do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, params: { user_id: user.id, id: registered_application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { user_id: user.id, id: registered_application.id }
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    it "increases the number of RegisteredApplication by 1" do
      expect{post :create, params: {user_id: user.id, registered_application: attributes_for(:registered_application) }}.to change(RegisteredApplication,:count).by(1)
    end

    it "assigns the new registered_app to @registered_app" do
      post :create, params: {user_id: user.id, registered_application: {name: registered_application.name, url: registered_application.url}}
      expect(assigns(:registered_app)).to eq RegisteredApplication.last
    end

    it "redirects to the new registered_app" do
      post :create, params: {user_id: user.id, registered_application: {name: registered_application.name, url: registered_application.url}}
      expect(response).to redirect_to user_registered_application_path(id: RegisteredApplication.last.id)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { user_id: user.id, id: registered_application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { user_id: user.id, id: registered_application.id }
      expect(response).to render_template :show
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { user_id: user.id, id: registered_application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { user_id: user.id, id: registered_application.id }
      expect(response).to render_template :edit
    end
  end

  describe "PUT update" do
    it "updates registered_app with expected attributes" do
      new_name = registered_application2.name
      new_url = registered_application2.url

      put :update, params: { user_id: user.id, id: registered_application2.id, registered_app: {name: new_name, url: new_url} }

      updated_app = assigns(:registered_app)
      expect(updated_app.id).to eq registered_application2.id
      expect(updated_app.name).to eq new_name
      expect(updated_app.url).to eq new_url
    end

    it "redirects to the updated registered_app" do
      new_name = registered_application2.name
      new_url = registered_application2.url

      put :update, params: { user_id: user.id, id: registered_application2.id, registered_app: {name: new_name, url: new_url} }
      expect(response).to redirect_to user_registered_application_path(id: registered_application2.id)
    end
  end

  describe "DELETE destroy" do
    it "deletes the registered_app" do
      delete :destroy, params: { user_id: user.id, id: registered_application.id }
      count = RegisteredApplication.where({id: registered_application.id}).size
      expect(count).to eq 0
    end

    it "redirects to registered_apps index" do
      delete :destroy, params: { user_id: user.id, id: registered_application.id }
      expect(response).to redirect_to user_registered_applications_path
    end
  end
end
