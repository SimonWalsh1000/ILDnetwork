require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :specialist => false,
      :experience => 1,
      :institute => "Institute",
      :radioloigst => false,
      :pathologist => false,
      :schedule => "Schedule",
      :cases => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Institute/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Schedule/)
    expect(rendered).to match(/2/)
  end
end
