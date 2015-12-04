require 'rails_helper'

RSpec.describe "Rads", type: :request do
  describe "GET /rads" do
    it "works! (now write some real specs)" do
      get rads_path
      expect(response).to have_http_status(200)
    end
  end
end
