class Item < ApplicationRecord
  belongs_to :user
  has_many :favourites
  has_many :reserve

  validates :make, :model, :image_url, :price, :desc,  presence: true
end
