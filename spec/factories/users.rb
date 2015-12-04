# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  specialist      :boolean
#  experience      :integer
#  institute       :string
#  radiologist     :boolean
#  pathologist     :boolean
#  schedule        :string
#  cases           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  member_id       :integer
#  country         :string
#  ipf             :integer
#  nurse           :boolean
#  genetics        :boolean
#  physio          :boolean
#  rheum           :boolean
#  ipfpatients     :integer
#  sarcoidpatients :integer
#  IIPpatients     :integer
#  CTDpatients     :integer
#  unclasspatients :integer
#

FactoryGirl.define do
  factory :user do
    specialist false
experience 1
institute "MyString"
radioloigst false
pathologist false
schedule "MyString"
cases 1
  end

end
