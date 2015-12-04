# == Schema Information
#
# Table name: physicians
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  experience :integer
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :physician do
    user_id 1
experience 1
type ""
  end

end
