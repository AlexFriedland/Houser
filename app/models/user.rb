class User < ApplicationRecord
  validates :email, presence: true
  validates :email, unique: true
end
