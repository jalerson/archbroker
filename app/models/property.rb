class Property < ActiveRecord::Base
  belongs_to :type
  belongs_to :category
  belongs_to :size
  has_many :sales
  
end
