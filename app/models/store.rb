# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Store < ActiveRecord::Base

  has_many :line_items
  has_many :invitations
  has_many :staffs, :through => :invitations

end
