class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
  has_many :items
  has_many :favourites
  has_many :reserve

  def self.fav_items(user)
    favs = []
    user.favourites.each { |a| favs << a.item_id }
    Item.where(id: favs)
  end
end
