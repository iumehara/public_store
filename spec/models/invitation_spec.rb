# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  staff_id   :integer
#  store_id   :integer
#  credential :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Invitation do
  pending "add some examples to (or delete) #{__FILE__}"
end
