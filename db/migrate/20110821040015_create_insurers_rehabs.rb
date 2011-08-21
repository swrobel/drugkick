class CreateInsurersRehabs < ActiveRecord::Migration
  def self.up
    create_table :insurers_rehabs, :id => false do |t|
      t.integer :insurer_id
      t.integer :rehab_id
    end
    
    add_index :insurers_rehabs, [:insurer_id, :rehab_id], :unique => true
  end

  def self.down
    drop_table :insurers_rehabs
  end
end
