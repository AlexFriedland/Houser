class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :email, uniqueness: true

  validates :password, presence: true
  :has_secure_password
  has_secure_password
  has_many :houses
  has_many :comments

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
