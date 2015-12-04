require 'rails_helper'

RSpec.describe "rheumatologists/index", type: :view do
  before(:each) do
    assign(:rheumatologists, [
      Rheumatologist.create!(),
      Rheumatologist.create!()
    ])
  end

  it "renders a list of rheumatologists" do
    render
  end
end
