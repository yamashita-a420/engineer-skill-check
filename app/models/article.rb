class Article < ApplicationRecord
  belongs_to :employee, foreign_key: 'author'

  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true

  scope :active, -> {
    where(deleted_at: nil)
  }
end
