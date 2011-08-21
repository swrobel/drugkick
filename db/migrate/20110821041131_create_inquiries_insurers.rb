class CreateInquiriesInsurers < ActiveRecord::Migration
  def self.up
    create_table :inquiries_insurers, :id => false do |t|
      t.integer :inquiry_id
      t.integer :insurer_id
    end
    
    add_index :inquiries_insurers, [:inquiry_id, :insurer_id], :unique => true
  end

  def self.down
    drop_table :inquiries_insurers
  end
end
