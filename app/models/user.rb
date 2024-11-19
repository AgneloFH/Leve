class User < ApplicationRecord
  # :confirmable, :timeoutable, :registerable, :rememberable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :validatable, :lockable, :trackable

  validations :blocked, presence: true

  #before_validation :generate_unique_code, on: :create
  #validates :code, presence: true, uniqueness: true
  #private
  #t.integer :code, null: false
 # def generate_unique_code
 #   loop do
 #     self.code = rand(100000..999999)
 #     Rails.logger.info "Generated code: #{self.code}"
 #     break unless User.exists?(code: code)
 #   end
 # end
end
