class Room < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :reservation

    with_options presence: true do
      validates :name
      validates :detail
      validates :adress
    end

    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    
    def self.search(search)
        return Room.all unless search
        Room.where('name LIKE(?)', "%#{search}%")
    end
end
