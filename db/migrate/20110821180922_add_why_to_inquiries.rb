class AddWhyToInquiries < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :why, :string
  end

  def self.down
    remove_column :inquiries, :why
  end
end
