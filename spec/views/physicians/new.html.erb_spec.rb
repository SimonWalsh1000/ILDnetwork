require 'rails_helper'

RSpec.describe "physicians/new", type: :view do
  before(:each) do
    assign(:physician, Physician.new(
      :user_id => 1,
      :experience => 1,
      :type => ""
    ))
  end

  it "renders new physician form" do
    render

    assert_select "form[action=?][method=?]", physicians_path, "post" do

      assert_select "input#physician_user_id[name=?]", "physician[user_id]"

      assert_select "input#physician_experience[name=?]", "physician[experience]"

      assert_select "input#physician_type[name=?]", "physician[type]"
    end
  end
end
