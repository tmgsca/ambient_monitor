class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  # GET /sessions/new
  def new
    redirect_to user_rooms_url(current_session.user) unless current_session.nil?
    @session = Session.new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      @session = Session.new(user: @user)
      respond_to do |format|
        if @session.save
          session[:token] = @session.token
          format.html { redirect_to user_rooms_url(@user) }
          format.json { render :show, status: :created, location: @session }
        else
          format.html { render :new }
          format.json { render json: @session.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @session = Session.new
        format.html {
          flash[:error] = "User not found"
          render :new
         }
        format.json { render json: @session.errors, status: :not_found }
      end
    end
  end

  # DELETE /sessions/:id
  def destroy
    @session.destroy
    respond_to do |format|
      session.clear
      format.html { redirect_to users_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # DELETE /sessions.json
  def sign_out
    if current_session.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      format.json { head :not_found }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:email, :password)
    end
end
