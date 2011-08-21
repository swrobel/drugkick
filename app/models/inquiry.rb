class Inquiry < ActiveRecord::Base
  geocoded_by :zip
  after_validation :geocode, :if => lambda{ |obj| obj.zip_changed? }

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
    %w[why location demographics drugs insurance price treatment_type religion finish]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1] 
  end

  def previous_step  
    self.current_step = steps[steps.index(current_step)-1]  
  end

  def last_step
    self.current_step = steps.last
  end  

  def first_step?  
    current_step == steps.first  
  end

  def last_step?  
    current_step == steps.last  
  end

  def all_valid?  
    steps.all? do |step|  
      self.current_step = step  
      valid?  
    end  
  end

  def num_results
    (25..500).to_a.sample
  end
end
