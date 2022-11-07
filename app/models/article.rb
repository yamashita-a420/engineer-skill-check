class Article < ApplicationRecord
  include Discard::Model

  belongs_to :employee

  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true
end
