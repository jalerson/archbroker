class Region < ActiveRecord::Base
  belongs_to :continent
  has_many :sales
end
