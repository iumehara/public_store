class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :staff_id
      t.integer :store_id
      t.string :credential

      t.timestamps
    end
  end
end
