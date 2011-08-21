class Lead < ActiveRecord::Base
  belongs_to :inquiry
  belongs_to :rehab
end
