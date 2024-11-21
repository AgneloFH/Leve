# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :generate_unique_code, on: :create

  # :confirmable, :timeoutable, :registerable, :rememberable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :validatable, :lockable, :trackable

  validates :blocked, presence: true

  validates :code, presence: true, uniqueness: true

 private

 def generate_unique_code
   loop do
     self.code = rand(100000..999999)
      Rails.logger.info "Generated code: #{self.code}"
      break unless User.exists?(code: code)
    end
  end
end
