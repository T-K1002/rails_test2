class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room), notice: "新しい施設を登録しました。"
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    if @room.user != current_user
      redirect_to rooms_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room), notice: "新しい施設を登録しました。"
    else
      render :edit
    end
  end

  def search
    if !params[:search_keyword].present? || params[:search_area].present?
      @rooms = Room.where('adress LIKE(?)', "%#{params[:search_area]}%")
    elsif params[:search_keyword].present?
      @rooms = Room.where('name LIKE(?) OR detail LIKE(?)', "%#{params[:search_keyword]}%", "%#{params[:search_keyword]}%")
    else
      @rooms = Room.all
    end
  end
  
  def own
    @rooms = current_user.rooms
  end

  private
  def room_params
    params.require(:room).permit(:name, :detail, :image, :price, :adress)
  end

end
