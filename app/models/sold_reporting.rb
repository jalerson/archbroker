class SoldReporting < ActiveRecord::Base
  belongs_to :sale
  belongs_to :user

  validate :duplicated_user_reporting, on: :create
  after_create :mark_as_sold_automatically?

  def duplicated_user_reporting
    if user.already_reported_sale_as_sold?(self)
      errors.add(:user_already_reported, "You already reported this property as sold!")
    end
  end

  def mark_as_sold_automatically?
    if self.sale.sold_reportings.count >= 3
      self.sale.mark_as_sold
      SaleMailer.property_marked_as_sold(self.sale).deliver
    else
      SaleMailer.sold_reporting_notification(self.sale).deliver
    end
  end
end
