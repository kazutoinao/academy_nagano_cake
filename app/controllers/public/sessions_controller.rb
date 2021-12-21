# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    def after_sign_out_path_for(resource)
      new_customer_session_path # ログアウト後に遷移するpathを設定
    end
    def after_sign_in_path_for(resource)#resouseは今ログインしようとしているユーザーの情報
      if resource.is_deleted == true
       reset_session#強制的にログアウト
        root_path
      else
        root_path
        #isdelited true 強制的にログアウトしたのち（reset session）最初のページに戻る
      end
    end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end