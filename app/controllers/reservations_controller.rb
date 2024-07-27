class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @reservations = current_user.reservations.all
    @products = Product.all
  end

  def create
    product = Product.find(params[:product_id])
    reservation = product.reservations.new(reservation_params)
    reservation.total_price = reservation.sum_of_price

    if reservation.save
      redirect_to reservations_index_path, notice: '予約が正常に作成されました。'
    else
      redirect_to product_url(product), alert: '予約の作成に失敗しました。'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:total_quantity).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
