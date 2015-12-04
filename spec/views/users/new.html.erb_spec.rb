require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :specialist => false,
      :experience => 1,
      :institute => "MyString",
      :radioloigst => false,
      :pathologist => false,
      :schedule => "MyString",
      :cases => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_specialist[name=?]", "user[specialist]"

      assert_select "input#user_experience[name=?]", "user[experience]"

      assert_select "input#user_institute[name=?]", "user[institute]"

      assert_select "input#user_radioloigst[name=?]", "user[radioloigst]"

      assert_select "input#user_pathologist[name=?]", "user[pathologist]"

      assert_select "input#user_schedule[name=?]", "user[schedule]"

      assert_select "input#user_cases[name=?]", "user[cases]"
    end
  end
end
