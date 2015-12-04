require 'rails_helper'

RSpec.describe "paths/show", type: :view do
  before(:each) do
    @path = assign(:path, Path.create!(
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
