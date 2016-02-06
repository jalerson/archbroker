class Status < ActiveRecord::Base
  has_many :sales

  def self.sold
    return Status.find(2)
  end

  def self.selling
    return Status.find(1)
  end

  def self.removed_for_breaking_rules
    return Status.find(3)
  end

  def self.deleted_by_the_owner
    return Status.find(4)
  end
end
