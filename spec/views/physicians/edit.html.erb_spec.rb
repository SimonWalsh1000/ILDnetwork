require 'rails_helper'

RSpec.describe "physicians/edit", type: :view do
  before(:each) do
    @physician = assign(:physician, Physician.create!(
      :user_id => 1,
      :experience => 1,
      :type => ""
    ))
  end

  it "renders the edit physician form" do
    render

    assert_select "form[action=?][method=?]", physician_path(@physician), "post" do

      assert_select "input#physician_user_id[name=?]", "physician[user_id]"

      assert_select "input#physician_experience[name=?]", "physician[experience]"

      assert_select "input#physician_type[name=?]", "physician[type]"
    end
  end
end
