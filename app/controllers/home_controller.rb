class HomeController < ApplicationController
  def index
    render json: 'Вітаємо в магазині Electro backup'
  end
end
