class Server < ActiveRecord::Base
  belongs_to :server_region
  has_many :sales
end
