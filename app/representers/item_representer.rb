class ItemRepresenter
  def initialize(item, user_id)
    @item = item
    @user_id = user_id
  end

  def as_json
    {
      id: item.id,
      owner: item.user.username,
      name: item_name(item),
      fav: favourite?(item.id, user_id),
      price: item.price,
      desc: item.desc,
      image: item.image_url,
      date_added: item.created_at
    }
  end

  private

  def item_name(item)
    "#{item.make} #{item.model}"
  end

  def favourite?(item_id, user_id)
    item = Item.find(item_id)
    item.favourites.where(user_id: user_id).count.zero? ? 'No' : 'Yes'
  end

  attr_reader :item, :user_id
end
