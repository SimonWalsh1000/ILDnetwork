require 'rails_helper'

RSpec.describe "physicians/index", type: :view do
  before(:each) do
    assign(:physicians, [
      Physician.create!(
        :user_id => 1,
        :experience => 2,
        :type => "Type"
      ),
      Physician.create!(
        :user_id => 1,
        :experience => 2,
        :type => "Type"
      )
    ])
  end

  it "renders a list of physicians" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
