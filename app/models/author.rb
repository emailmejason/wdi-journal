class Author < ActiveRecord::Base
  has_secure_password

  attr_accessible :age, :bio, :first_name, :last_name, :email, :password, :password_confirmation

  validates :email, :uniqueness => true
end
