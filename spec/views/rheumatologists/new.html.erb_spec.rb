require 'rails_helper'

RSpec.describe "rheumatologists/new", type: :view do
  before(:each) do
    assign(:rheumatologist, Rheumatologist.new())
  end

  it "renders new rheumatologist form" do
    render

    assert_select "form[action=?][method=?]", rheumatologists_path, "post" do
    end
  end
end
