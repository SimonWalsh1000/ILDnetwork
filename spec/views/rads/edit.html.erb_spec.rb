require 'rails_helper'

RSpec.describe "rads/edit", type: :view do
  before(:each) do
    @rad = assign(:rad, Rad.create!(
      :user_id => 1,
      :experience => 1,
      :type => ""
    ))
  end

  it "renders the edit rad form" do
    render

    assert_select "form[action=?][method=?]", rad_path(@rad), "post" do

      assert_select "input#rad_user_id[name=?]", "rad[user_id]"

      assert_select "input#rad_experience[name=?]", "rad[experience]"

      assert_select "input#rad_type[name=?]", "rad[type]"
    end
  end
end
