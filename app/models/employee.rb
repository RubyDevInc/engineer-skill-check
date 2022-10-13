# frozen_string_literal: true

# rubocop:disable Rails/UniqueValidationWithoutIndex
class Employee < ApplicationRecord
  belongs_to :office
  belongs_to :department
  has_many :profiles, dependent: :destroy

  validates :number, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
# rubocop:enable Rails/UniqueValidationWithoutIndex
