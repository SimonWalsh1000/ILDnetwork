# == Schema Information
#
# Table name: rads
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  experience :integer
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Rad, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
