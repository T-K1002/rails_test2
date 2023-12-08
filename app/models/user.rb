class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  with_options presence: true do
    validates :username
  end
  
end
