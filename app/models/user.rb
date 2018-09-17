class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  :has_secure_password
  has_secure_password
  has_many :houses

  #name, image, uid
  #
end
