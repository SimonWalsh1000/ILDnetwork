require 'rails_helper'

RSpec.describe "rads/new", type: :view do
  before(:each) do
    assign(:rad, Rad.new(
      :user_id => 1,
      :experience => 1,
      :type => ""
    ))
  end

  it "renders new rad form" do
    render

    assert_select "form[action=?][method=?]", rads_path, "post" do

      assert_select "input#rad_user_id[name=?]", "rad[user_id]"

      assert_select "input#rad_experience[name=?]", "rad[experience]"

      assert_select "input#rad_type[name=?]", "rad[type]"
    end
  end
end
