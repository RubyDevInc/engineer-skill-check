class Article < ApplicationRecord
  validates :title, length: { minimum: 1, maximum: 50 }
  validates :content, presence: true
end
