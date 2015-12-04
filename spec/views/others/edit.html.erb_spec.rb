require 'rails_helper'

RSpec.describe "others/edit", type: :view do
  before(:each) do
    @other = assign(:other, Other.create!())
  end

  it "renders the edit other form" do
    render

    assert_select "form[action=?][method=?]", other_path(@other), "post" do
    end
  end
end
