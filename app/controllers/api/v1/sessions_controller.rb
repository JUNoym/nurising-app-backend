class Api::V1::SessionsController < ApplicationController
    def index
        render json: {status: 'SUCCESS', data:AuthUser.all}
    end

    def create
        # http://localhost:3030/api/v1/sessions?email=saisyuu@gmail.com&password=02030203ii
        user = AuthUser.find_by(email:login_params[:email])
        if user && user.authenticate(login_params[:password])
            render json: {status: 'SUCCESS', message:'ログインに成功しました', data:user}
        else
            render json: {status: 'ERROR', message:'ログインに失敗しました'}
        end
    end

    private
        def login_params
            params.permit(:email, :password)
        end
end
