class ApplicationController < ActionController::Base
  
   
before_action :configure_permitted_parameters, if: :devise_controller?

 

  protected
  
  def fobid_login_user
    if @current_user
      flash[:notice]="ログインしています"
      redirect_to("/user/items/index")
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end 
end
