class Rincome < ApplicationRecord
  belongs_to :week, optional: true
  belongs_to :payment, optional: true


end
