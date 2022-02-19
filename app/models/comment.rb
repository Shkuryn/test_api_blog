class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :article_id, presence: true
end
