require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :specialist => false,
        :experience => 1,
        :institute => "Institute",
        :radioloigst => false,
        :pathologist => false,
        :schedule => "Schedule",
        :cases => 2
      ),
      User.create!(
        :specialist => false,
        :experience => 1,
        :institute => "Institute",
        :radioloigst => false,
        :pathologist => false,
        :schedule => "Schedule",
        :cases => 2
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Institute".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Schedule".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
