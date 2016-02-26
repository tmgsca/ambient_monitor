class MeasuresController < ApplicationController
before_action :set_user
before_action :set_room

  def index
    @measures = @room.measures
  end

  def create
    validate_measure_room_session
    @measure = Measure.new(measure_params)
    @measure.room = @room
    respond_to do |format|
      if @measure.save
        Measure.clean_old_measures(@room)
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

    def validate_measure_room_session
      unless @room.session.present? && @room.session == current_session
        head :unauthorized
        false
      end
    end

    def set_user
      @user = User.find(params[:user_id])
      head :unauthorized unless @user == current_session.user || current_session.user.role_id == 1
    end

    def measure_params
        params.require(:measure).permit(:temperature, :humidity)
    end
end
