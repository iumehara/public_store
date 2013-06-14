class AddRememberTokenToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :remember_token, :string
  end
end
