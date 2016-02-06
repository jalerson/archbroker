class SaleMailer < ActionMailer::Base
  default from: "admin@archbroker.com"

  def sold_reporting_notification(sale)
    @sale = sale
    @user = sale.user
    mail(to: @user.email, subject: '[Archbroker] Your property was sold?')
  end

  def property_marked_as_sold(sale)
    @sale = sale
    @user = sale.user
    mail(to: @user.email, subject: '[Archbroker] Your property was marked as sold')
  end

  def breaking_rules_notification(sale)
    @sale = sale
    @user = sale.user
    mail(to: "admin@archbroker.com", subject: '[Archbroker] Breaking rules notification')
  end

  def sale_matches_with_user_criteria(user, sale)
    @user = user
    @sale = sale
    mail(to: user.email, subject: '[Archbroker] Sales Advisor: We found something interesting for you!')
  end
end
