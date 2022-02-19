class User < ApplicationRecord
  has_many :articles
  validates :name, presence: true,  uniqueness: true
  validates :email, presence: true,  uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_length_of :password, minimum: 6
  validates_associated :articles
end
