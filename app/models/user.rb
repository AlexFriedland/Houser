class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  :has_secure_password
  has_secure_password
  has_many :houses

  #name, image, uid
  #

  def all_years
    ya = []
    self.houses.each do |h|
      h.years.each do |y|
        ya << y.year
      end
    end
    return ya.uniq!
  end
  
end
