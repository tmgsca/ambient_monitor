class MeasuresController < ApplicationController
before_action :set_user
before_action :set_room

  def index
    @measures = @room.measures
  end

  def create
    @measure = Measure.new(measure_params)
    @measure.room = @room
    respond_to do |format|
      if @measure.save
        format.json { head :created }
      else
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_user
      @user = User.find(params[:user_id])
      head :unauthorized unless @user == current_session.user || current_session.user.role_id == 1
    end

    def measure_params
        params.require(:measure).permit(:temperature, :humidity)
    end
end
