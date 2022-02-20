class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :header, presence: true, length: { maximum: 100 }
  validates :body,   presence: true
  validates :user_id, presence: true
  scope :by_article_id, ->(id) { where(id: id).pluck(:id, :header, :body, :category, :created_at) }
  scope :with_users,    ->(user_id) { where('user_id = ?', user_id) }
  scope :with_category, ->(category) { where('category = ?', category) }
  def self.filter(params)
    articles = Article.all
    articles = articles.with_users(params['user_id']) if params['user_id'].present?
    articles = articles.with_category(params['category']) if params['category'].present?
    return articles
  end
end

