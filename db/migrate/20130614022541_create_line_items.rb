class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :store_id
      t.string :private_info

      t.timestamps
    end
  end
end
