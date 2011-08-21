class Rehab < ActiveRecord::Base
  has_and_belongs_to_many :drugs
  has_and_belongs_to_many :insurers
  has_and_belongs_to_many :religions
  has_and_belongs_to_many :treatment_types
  has_many :leads
  has_many :inquiries, :through => :leads
end
