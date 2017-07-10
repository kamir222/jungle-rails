class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    user && user.authenticate(password)
  end

end
