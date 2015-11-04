class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :name, :password, length: { 
    in: 6..20
   # minimum: 6, 
   # maximum: 20, 
   # tokenizer: lambda { |str| str.scan(/\w+/) }, 
   # too_short: "must have at least %{count} words", 
   # too_long: "must have at least %{count} words"
  }
  validates :password, confirmation: true
  # validates :password_confirmation, presence: { message: "are not match" }
  # validates :mobile, numericality: { only_integer: true }
  # validates :mobile, format: { with: /1[\d]{10}/, 
  #  message: "invalid mobile number" }
  validates :name, :email, uniqueness: true

  has_many :articles
  has_secure_password
end
