class CreateDrugsRehabs < ActiveRecord::Migration
  def self.up
    create_table :drugs_rehabs, :id => false do |t|
      t.integer :drug_id
      t.integer :rehab_id
    end
    
    add_index :drugs_rehabs, [:drug_id, :rehab_id], :unique => true
  end

  def self.down
    drop_table :drugs_rehabs
  end
end
