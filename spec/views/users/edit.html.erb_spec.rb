require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :specialist => false,
      :experience => 1,
      :institute => "MyString",
      :radioloigst => false,
      :pathologist => false,
      :schedule => "MyString",
      :cases => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

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
