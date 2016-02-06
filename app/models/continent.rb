class Continent < ActiveRecord::Base
  has_many :regions
end
