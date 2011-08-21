class CreateInquiriesTreatmentTypes < ActiveRecord::Migration
  def self.up
    create_table :inquiries_treatment_types, :id => false do |t|
      t.integer :inquiry_id
      t.integer :treatment_type_id
    end
    
    add_index :inquiries_treatment_types, [:inquiry_id, :treatment_type_id], :unique => true, :name => "index_inquiries_treatment_types"
  end

  def self.down
    drop_table :inquiries_treatment_types
  end
end
