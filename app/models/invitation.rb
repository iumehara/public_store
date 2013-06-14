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

class Invitation < ActiveRecord::Base
  
  belongs_to :store
  belongs_to :staff

end
