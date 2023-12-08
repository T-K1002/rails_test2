class Reservation < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :room
end
