# frozen_string_literal: true

class PropertyType < ApplicationRecord
  # Associações
  has_many :properties

  validates :name, presence: true
  validates :name, length: { maximum: 50 }
end
