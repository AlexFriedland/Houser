class WeekRenter < ApplicationRecord
  belongs_to :week
  belongs_to :renter

end
