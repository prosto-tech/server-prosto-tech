class ReservesController < ApplicationController
  before_action :authenticate_request!

  def index
    favourites = Favourite.find_by(user_id: current_user!.id)

    render json: ItemsRepresenter.new(favourites, current_user!.id).as_json
  end

  def create
    reserve = current_user!.reserve.new(user_id: params[:user_id], item_id: params[:item_id], phone_number:params[:phone], desired_time: params[:date])

    if reserve.save
      render json: { message: 'Успішно надіслано' }, status: :created
    else
      render json: { error: reserve.errors.full_messages.first }, status: :unprocessable_entity
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

  def drive_params
    params.require(:reserve).permit(:phone_number, :desired_time)
  end
end