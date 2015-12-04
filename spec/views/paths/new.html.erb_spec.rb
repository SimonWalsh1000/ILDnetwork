require 'rails_helper'

RSpec.describe "paths/new", type: :view do
  before(:each) do
    assign(:path, Path.new(
      :user_id => 1,
      :experience => 1,
      :type => ""
    ))
  end

  it "renders new path form" do
    render

    assert_select "form[action=?][method=?]", paths_path, "post" do

      assert_select "input#path_user_id[name=?]", "path[user_id]"

      assert_select "input#path_experience[name=?]", "path[experience]"

      assert_select "input#path_type[name=?]", "path[type]"
    end
  end
end
