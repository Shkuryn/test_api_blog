class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :header, presence: true, length: { maximum: 100 }
  validates :body,   presence: true
  validates :user_id, presence: true
end
