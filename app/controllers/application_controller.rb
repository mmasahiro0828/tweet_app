class ApplicationController < ActionController::Base
    helper_method :current_user
    
    
    
    
    private
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def login_required  
        redirect_to login_url unless current_user
    end
    
    def authenticated_user
        unless current_user.id == params[:id].to_i
            redirect_to users_path, notice: "権限がありません。"
        end
    end
end
