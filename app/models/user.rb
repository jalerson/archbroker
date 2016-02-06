class User < ActiveRecord::Base
	has_many :sales
  has_many :sold_reportings
  has_many :ratings, through: :sales
  has_many :interests
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def reset_password
    new_password = rand_password=('0'..'z').to_a.shuffle.first(8).join
    self.update(password: new_password)
    return new_password
  end

  def already_rated_by(user)
    self.ratings.each do |rating|
      if rating.user.id == user.id
        return true
      end
    end
    return false
  end

  def ratings_by_status(status)
    return self.ratings.where(rating: status)
  end

  def sales_by_status(status)
    return self.sales.where(status: status)
  end

  def already_reported_sale_as_sold?(sale)
    sold_reportings.each do |report|
      if report.sale.id == sale.id
        return true
      end
    end
    return false
  end
end
