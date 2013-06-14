# == Schema Information
#
# Table name: line_items
#
#  id           :integer          not null, primary key
#  store_id     :integer
#  private_info :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  name         :string(255)
#

class LineItem < ActiveRecord::Base

  belongs_to :store

end
