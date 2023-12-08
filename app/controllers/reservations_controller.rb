class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations
  end

  def confirm
    @reservation = Reservation.new(reservation_check)
    @user_id = current_user.id
    @room = Room.find_by(params[:room_id])
 
    if @reservation.check_in == nil || @reservation.check_out == nil || @reservation.people == nil
     flash[:alert_blank] = "予約に失敗しました。未入力の必須項目があります。"
     redirect_to room_path(@reservation.room_id) and return
    elsif @reservation.check_in < Date.today
      flash[:alert_today] = "本日以降の日付にしてください。"
      redirect_to room_path(@reservation.room_id) and return
    elsif @reservation.check_out < @reservation.check_in || @reservation.check_in == @reservation.check_out
     flash[:alert_day] = "チェックアウトはチェックイン以前に指定できません。"
     redirect_to room_path(@reservation.room_id) and return
   

    elsif @reservation.people < 0 || @reservation.people == 0
     flash[:alert_number] = "人数を0以下にできません。"
     redirect_to room_path(@reservation.room_id) and return
    else
     @day = (@reservation.check_out - @reservation.check_in).to_i
     @total = @day * @reservation.price * @reservation.people
    end
   end

   def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: "新しい予約を登録しました。"
    else
      redirect_to room_path(@reservation.room_id) and return
    end
  end

  private

  def reservation_check
    params.permit(:check_in, :check_out, :people, :price, :room_id)
  end

  def reservation_params
    params.require(:reservation).permit(:image, :name, :detail, :price, :check_in, :check_out, :room_id, :user_id, :day, :people)
  end

end
