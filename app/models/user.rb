class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  :has_secure_password
end
