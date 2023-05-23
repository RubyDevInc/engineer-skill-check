# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :employee
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
