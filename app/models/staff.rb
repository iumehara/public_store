# == Schema Information
#
# Table name: staffs
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Staff < ActiveRecord::Base

	has_many :invitations
	has_many :stores, :through => :invitations
	has_secure_password
end
