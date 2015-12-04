require 'rails_helper'

RSpec.describe "rheumatologists/edit", type: :view do
  before(:each) do
    @rheumatologist = assign(:rheumatologist, Rheumatologist.create!())
  end

  it "renders the edit rheumatologist form" do
    render

    assert_select "form[action=?][method=?]", rheumatologist_path(@rheumatologist), "post" do
    end
  end
end
