class Article < ApplicationRecord
  belongs_to :employees

  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  validates :content, presence: true
  validates :author, presence: true

  scope :active, -> {
    where(deleted_at: nil)
  }
end
