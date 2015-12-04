require 'rails_helper'

RSpec.describe "paths/edit", type: :view do
  before(:each) do
    @path = assign(:path, Path.create!(
      :user_id => 1,
      :experience => 1,
      :type => ""
    ))
  end

  it "renders the edit path form" do
    render

    assert_select "form[action=?][method=?]", path_path(@path), "post" do

      assert_select "input#path_user_id[name=?]", "path[user_id]"

      assert_select "input#path_experience[name=?]", "path[experience]"

      assert_select "input#path_type[name=?]", "path[type]"
    end
  end
end
