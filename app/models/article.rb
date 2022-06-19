class Article < ApplicationRecord
  # belongs_to :Author, class_name: "Employee"
  belongs_to :employee
  validates :title, presence: true, length: { maximum: 50 }

  scope :active, -> {
    where(deleted_at: nil)
  }
end
