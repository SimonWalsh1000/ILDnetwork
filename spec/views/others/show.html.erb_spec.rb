require 'rails_helper'

RSpec.describe "others/show", type: :view do
  before(:each) do
    @other = assign(:other, Other.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
