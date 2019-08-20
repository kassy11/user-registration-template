class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
   
   #以下を追記
   before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile])
    end

    #ログアウト後
    def after_sign_out_path_for(resource)
        root_path
    end
 
    #ログイン後
    def after_sign_in_path_for(resource)
        mypage_path(resource)
    end

    #新規登録後
    def after_sign_up_path_for(resource)
        mypage_path(resource)
    end
end

