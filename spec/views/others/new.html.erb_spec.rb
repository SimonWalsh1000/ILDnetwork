require 'rails_helper'

RSpec.describe "others/new", type: :view do
  before(:each) do
    assign(:other, Other.new())
  end

  it "renders new other form" do
    render

    assert_select "form[action=?][method=?]", others_path, "post" do
    end
  end
end
