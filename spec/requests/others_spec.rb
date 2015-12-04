require 'rails_helper'

RSpec.describe "Others", type: :request do
  describe "GET /others" do
    it "works! (now write some real specs)" do
      get others_path
      expect(response).to have_http_status(200)
    end
  end
end
