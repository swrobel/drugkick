class CreateDrugsInquiries < ActiveRecord::Migration
  def self.up
    create_table :drugs_inquiries, :id => false do |t|
      t.integer :drug_id
      t.integer :inquiry_id
    end
    
    add_index :drugs_inquiries, [:drug_id, :inquiry_id], :unique => true
  end

  def self.down
    drop_table :drugs_inquiries
  end
end
