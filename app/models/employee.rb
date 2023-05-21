# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :office
  belongs_to :department
  has_many :profiles
  has_many :articles

  validates :number, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true
  validates :e_mail, presence: true, uniqueness: true
  validates :date_of_joining, presence: true

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
