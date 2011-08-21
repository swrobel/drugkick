class CreateRehabsReligions < ActiveRecord::Migration
  def self.up
    create_table :rehabs_religions, :id => false do |t|
      t.integer :rehab_id
      t.integer :religion_id
    end
    
    add_index :rehabs_religions, [:rehab_id, :religion_id], :unique => true
  end

  def self.down
    drop_table :rehabs_religions
  end
end
