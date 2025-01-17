# frozen_string_literal: true

class Property < ApplicationRecord
  before_validation :generate_unique_code, on: :create
  # Associações
  belongs_to :property_type

  # Validações
  validates :title, presence: true
  validates :description, presence: true
  validates :usable_area, presence: true, numericality: { greater_than: 0 }
  validates :code, presence: true, uniqueness: true
  validates :bedrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :bathrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :washrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :suites, numericality: { greater_than_or_equal_to: 0 }
  validates :garage_space, numericality: { greater_than_or_equal_to: 0 }
  validates :property_type, presence: true

  # Scopes (se necessário)
  # scope :available, -> { where(status: 'available') }

  private

 def generate_unique_code
   loop do
     self.code = rand(100000..999999)
      Rails.logger.info "Generated code: #{self.code}"
      break unless Property.exists?(code: code)
    end
  end
end
