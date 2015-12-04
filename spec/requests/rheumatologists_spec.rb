require 'rails_helper'

RSpec.describe "Rheumatologists", type: :request do
  describe "GET /rheumatologists" do
    it "works! (now write some real specs)" do
      get rheumatologists_path
      expect(response).to have_http_status(200)
    end
  end
end
