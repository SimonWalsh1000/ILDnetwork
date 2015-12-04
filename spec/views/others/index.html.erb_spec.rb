require 'rails_helper'

RSpec.describe "others/index", type: :view do
  before(:each) do
    assign(:others, [
      Other.create!(),
      Other.create!()
    ])
  end

  it "renders a list of others" do
    render
  end
end
