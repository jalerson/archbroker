class Interest < ActiveRecord::Base
  belongs_to :server
  belongs_to :category
  belongs_to :type
  belongs_to :size
  belongs_to :user
  belongs_to :property

  def region
    if self.region_code != ""
      id = self.region_code.split('_')[1].to_i
      if self.region_code.include?('region_')
        return Region.find(id)
      else
        return Continent.find(id)
      end
    else
      return nil
    end
  end
end
