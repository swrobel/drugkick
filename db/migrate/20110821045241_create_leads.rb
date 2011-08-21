class CreateLeads < ActiveRecord::Migration
  def self.up
    create_table :leads do |t|
      t.integer :inquiry_id
      t.integer :rehab_id
      t.decimal :price
      t.boolean :purchased

      t.timestamps
    end

    add_index :leads, [:inquiry_id, :rehab_id], :unique => true
  end

  def self.down
    drop_table :leads
  end
end
