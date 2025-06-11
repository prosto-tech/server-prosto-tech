class ItemsRepresenter
  def initialize(items, user_id)
    @items = items
    @user_id = user_id
  end

  def as_json
    items.map do |item|
      {
        id: item.id,
        owner: item.user.username,
        name: item_name(item),
        fav: favourite?(item.id, user_id),
        price:item.price,
        image: item.image_url,
        date_added: item.created_at
      }
    end
  end

  private

  def item_name(item)
    "#{item.make} #{item.model}"
  end

  def ac?(item)
    item.ac == 'true' ? 'Клімат контроль' : 'немає клімат контролю'
  end

  def favourite?(item_id, user_id)
    item = Item.find(item_id)
    item.favourites.where(user_id: user_id).count.zero? ? 'No' : 'Yes'
  end

  attr_reader :items, :user_id
end
