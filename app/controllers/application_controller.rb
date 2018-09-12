class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  def after_sign_in_path_for(resource)
        flash[:notice] = "Welcome! You have signed up successfully." #　 <-任意で
        user_path(current_user.id)  #　指定したいパスに変更
  end

    # サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
        flash[:notice] = "ログアウトしました"
        root_path
  end
end
