require 'rails_helper'

describe HomeController do
  context "Index page" do
    it "should return the homepage" do
      get :index
      expect(response.status).to eq 200
      expect(response).to render_template :index
    end
  end

  context "other pages" do
    it "should get privacy page" do
      get :privacy
      expect(response.status).to eq 200
      expect(response).to render_template :privacy
    end

    it "should get tos page" do
      get :tos
      expect(response.status).to eq 200
      expect(response).to render_template :tos
    end
  end
end