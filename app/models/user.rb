class User < ActiveRecord::Base
  validates :name, :password, :email, presence: true
  validates :name, :password, length: { 
    minimum: 6, 
    maximum: 20, 
    tokenizer: lambda { |str| str.scan(/\w+/) }, 
    too_short: "must have at least %{count} words", 
    too_long: "must have at least %{count} words"
  }
  validates :password, confirmation: true
  # validates :mobile, numericality: { only_integer: true }
  # validates :mobile, format: { with: /1[\d]{10}/, 
  #  message: "invalid mobile number" }
  
  has_many :articles
end
