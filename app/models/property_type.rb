class PropertyType < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 50 }
end
