require 'rails_helper'

describe HomeController do
  context "Index page" do
    it "should return the homepage" do
      get :index
      expect(response.status).to eq 200
      expect(response).to render_template :index
    end
  end
end