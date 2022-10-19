# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :employees, dependent: :nullify
  validates :name, presence: true
end
