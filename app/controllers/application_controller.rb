class ApplicationController < ActionController::API
    # Railsが認証トークンを使用しないようにする。
    # 認証トークンというのは、CSRF攻撃を防ぐために、
    # Railsフォームからコントローラへと送信されるパラメータの中に追加される
    # セキュリティートークンのことですが、ここでは使用しないのでスキップさせます。
    
    skip_before_action :verify_authenticity_token
    protect_from_forgery

    helper_method :login!, :current_user

    def login!
        session[:user_id] = @user.id
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
