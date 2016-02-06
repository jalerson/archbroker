class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  belongs_to :server
  belongs_to :region
  has_many :sold_reportings
  belongs_to :status
  has_many :ratings

  after_create :advise_users

  def advise_users
    Interest.where(server_id: self.server.id).each do |interest|
      matches = true
      
      if interest.region.present?
        if interest.region_code.include?('region_')
          if self.region.id != interest.region.id
            matches = false
          end
        else
          unless interest.region.regions.include?(self.region)
            matches = false
          end
        end
      end

      unless interest.min_price.blank?
        if self.price < interest.min_price
          matches = false
        end
      end

      unless interest.max_price.blank?
        if self.price > interest.max_price
          matches = false
        end
      end

      if interest.category.present?
        if self.property.category.id != interest.category.id
          matches = false
        end
      end

      if interest.type.present?
        if self.property.type.id != interest.type.id
          matches = false
        end
      end

      if interest.size.present?
        if self.property.size.id != interest.size.id
          matches = false
        end
      end

      if interest.property.present?
        if self.property.id != interest.property.id
          matches = false
        end
      end

      if interest.appraisal
        if self.appraisal != interest.appraisal
          matches = false
        end
      end

      if matches
        SaleMailer.sale_matches_with_user_criteria(interest.user, self).deliver
      end
    end
  end

  def appraisal?
    if self.appraisal
      return 'Yes'
    else
      return 'No'
    end
  end

  def selling?
    return self.status.id == Status.selling.id
  end

  def sold?
    return self.status.id == Status.sold.id
  end

  def removed_for_breaking_rules?
    return self.status.id == Status.removed_for_breaking_rules.id
  end

  def deleted_by_the_owner?
    return self.status.id == Status.deleted_by_the_owner.id
  end

  def short_title
    if self.title.length > 50
      return "#{self.title[0..50]}..."
    else
      return self.title
    end
  end

  def enable_sold_report?(current_user)
    if (Time.now - self.created_at > 5.days) and (current_user.id != self.user.id) and !(self.sold?)
      return true
    else
      return false
    end
  end

  def mark_as_sold
    self.update(status: Status.sold)
  end

  def mark_as_unsold
    self.sold_reportings.each do |report|
      report.delete
    end
    self.update(status: Status.selling)
  end

  def mark_as_sold_automatically?
    return self.sold_reportings.count >= 3
  end
end
