class ItemsController < ApplicationController
  # before_action :authenticate_request!
  # rescue_from NoMethodError, with: :no_user
  MAX_PAGINATION_LIMIT = 20

  def index
    # current_user = current_user!
    items = Item.limit(limit).offset(params[:offset])

    render json: ItemsRepresenter.new(items, 1).as_json
  end

  def create
    p "params: #{params}"
    current_user = current_user!

    item = current_user.items.create(item_params)

    if item.save
      render json: ItemRepresenter.new(item).as_json, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def show
    current_user = current_user!
    p "current_user: #{current_user}"
    p "params: params"
    item = Item.find(params[:id])

    render json: ItemRepresenter.new(item, current_user.id).as_json
  end

  def destroy
    Item.find(params[:id]).destroy!

    head :no_content
  end

  private

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end

  def item_params
    params.require(:item).permit(:make, :model, :price, :desc, :image_url)
  end

  def no_user
    render json: { error: 'Для початку потрібно увійти' }, status: :unauthorized
  end
end