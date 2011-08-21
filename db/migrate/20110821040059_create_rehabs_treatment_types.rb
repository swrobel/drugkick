class CreateRehabsTreatmentTypes < ActiveRecord::Migration
  def self.up
    create_table :rehabs_treatment_types, :id => false do |t|
      t.integer :rehab_id
      t.integer :treatment_type_id
    end
    
    add_index :rehabs_treatment_types, [:rehab_id, :treatment_type_id], :unique => true
  end

  def self.down
    drop_table :rehabs_treatment_types
  end
end
