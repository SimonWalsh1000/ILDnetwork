require 'rails_helper'

RSpec.describe "rads/show", type: :view do
  before(:each) do
    @rad = assign(:rad, Rad.create!(
      :user_id => 1,
      :experience => 2,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Type/)
  end
end
