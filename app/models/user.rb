class User < ActiveRecord::Base
  validates :name, :password, :email, presence: true
  has_many :articles
end
