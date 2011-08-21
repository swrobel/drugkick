class Inquiry < ActiveRecord::Base
  has_and_belongs_to_many :drugs
  has_and_belongs_to_many :insurers
  has_and_belongs_to_many :religions
  has_and_belongs_to_many :treatment_types
  has_many :leads
  has_many :rehabs, :through => :leads

  attr_protected :ip  
  attr_writer :current_step  
    
  def current_step  
    @current_step || steps.first  
  end  
    
  def steps  
    %w[why_here location demographics drugs price_range treatment_type religion]  
  end
end
