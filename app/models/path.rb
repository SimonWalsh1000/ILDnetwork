# == Schema Information
#
# Table name: paths
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  experience :integer
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Path < ActiveRecord::Base
  belongs_to :user
end
