require 'rails_helper'

RSpec.describe "rheumatologists/show", type: :view do
  before(:each) do
    @rheumatologist = assign(:rheumatologist, Rheumatologist.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
