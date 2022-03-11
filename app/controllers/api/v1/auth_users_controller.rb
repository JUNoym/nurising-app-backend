class Api::V1::AuthUsersController < ApplicationController

    def index
        user = AuthUser.all
        render json: {status: 'SUCCESS', message:'ユーザー一覧を取得しました', data:user}
    end

    def show
        # エンドポイント　http://localhost:3030/api/v1/auth_users/1
        user = AuthUser.find(params[:id])
        render json: {user:user}
    end
    
    def create
        # エンドポイント　http://localhost:3030/api/v1/auth_users
        user = AuthUser.new(user_params)
        if user.save
            render json: {status: 'SUCCESS', message:'ユーザー作成に成功しました', data:user}
        else
            render json: {status: 'ERROR', message:'正常にユーザーを作成できませんでした', data:user.errors}
        end
    end

    private
        def user_params
            params.permit(:name, :email, :password, :password_confirmation)
        end
end