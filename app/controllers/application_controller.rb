class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :authenticate

	def authenticate
    if current_session.nil?
      respond_to do |format|
        format.html { redirect_to new_session_url, notice: 'You need to be logged in'}
        format.json { head :unauthorized  }
      end
    end
  end

  def authenticate_admin_only
    if current_session.nil? || current_session.user.role_id != 1
      respond_to do |format|
        format.html {
          if current_session.user.role_id != 1
            redirect_to user_rooms(current_session.user), notice: 'You are not authorized'
          else
            redirect_to new_session_url, notice: 'You need to be logged in'
          end
        }
        format.json { head :unauthorized  }
      end
    end
  end

  def current_session
      begin
        token = session[:token].present? ? session[:token] : token_and_options(request).first
        Session.find_by_token(token)
      rescue
        nil
      end
  end
end
