module Api
  module V1
    class FavouritesController < ApplicationController
      before_action :authenticate_request!

      def index
        favourites = User.fav_items(current_user!)

        render json: ItemsRepresenter.new(favourites, current_user!.id).as_json
      end

      def create
        favourite = current_user!.favourites.create(item_id: params[:item_id])

        if favourite.save
          render json: { message: 'Успішно додано до вподобаних' }, status: :created
        else
          render json: { error: favourite.errors.full_messages.first }, status: :unprocessable_entity
        end
      end

      def destroy
        favourite = Favourite.find_by(user_id: current_user!.id, item_id: params[:id])

        if favourite
          favourite.destroy
          render json: { message: 'Успішно видалено із вподобаних' }
        else
          render json: { message: 'Упс, щось пішло не так' }
        end
      end
    end
  end
end
