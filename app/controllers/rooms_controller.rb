class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(rooms_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: 'Room was successfully created!' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @room.update(rooms_params)
        format.html { redirect_to room_url(@room), notice: 'Room was successfully updated!' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed!' }
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name, :capacity)
  end
end
