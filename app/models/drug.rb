class Drug < ActiveRecord::Base
  has_and_belongs_to_many :inquiries
  has_and_belongs_to_many :rehabs
end
