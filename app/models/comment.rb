class Comment < ApplicationRecord
  belongs_to :employee
  belongs_to :article

  validates :content, presence: true, length: { maximum: 255 }
end
