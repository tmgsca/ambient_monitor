class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /users/1/rooms
  # GET /users/1/rooms.json
  def index
    @rooms = @user.rooms
  end

  # GET /users/1/rooms/1
  # GET /users/1/rooms/1.json
  def show
  end

  # GET /users/1/rooms/new
  def new
    @room = Room.new
  end

  # GET /users/1/rooms/1/edit
  def edit
  end

  # POST /users/1/rooms
  # POST /users/1/rooms.json
  def create
    @room = Room.new(room_params)
    @room.user = @user
    respond_to do |format|
      if @room.save
        format.html { redirect_to [@user, @room], notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: [@user, @room] }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1/rooms/1
  # PATCH/PUT /users/1/rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to [@user, @room], notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: [@user, @room] }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/rooms/1
  # DELETE /users/1/rooms/1.json
  def destroy
    validate_room_user
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def track
    @room = Room.find(params[:room_id])
    if @room.is_tracked || @room.user != @user
      head :unauthorized
      false
    end
    @room.session = current_session
    respond_to do |format|
      if @room.save
        format.json { head :no_content }
      else
        format.json { head :unprocessable_entity }
      end
    end
  end

  def untrack
    @room = Room.find(params[:room_id])
    unless @room.user == @user
      head :unauthorized
      return
    end
    @room.session = nil
    respond_to do |format|
      if @room.save
        format.json { head :no_content }
      else
        format.json { head :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
      head :unauthorized unless @user == current_session.user || current_session.user.role_id == 1
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name,
      :max_winter_temp, :max_summer_temp, :min_winter_temp, :min_summer_temp,
      :max_winter_humidity, :max_summer_humidity, :min_winter_humidity, :min_summer_humidity)
    end
end
