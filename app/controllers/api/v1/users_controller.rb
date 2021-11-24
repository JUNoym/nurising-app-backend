class Api::V1::UsersController < ApplicationController
    def index
        user = User.all
        render json: user
    end

  

    def show
        user = User.find(params[:id])
        render json: user
    end

   def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: {message: "エラー出てるよ"}
        end
   end

   def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: {message: "エラー出てるよ"}
        end
   end

   def destroy
        if User.destroy(params[:id])
            head :no_content
        else
            render json: {message: "エラー出てるよ"}
        end
   end

   def destroy_all
        if User.destroy_all
        head :no_content
        
        else
        render json: { error: "削除に失敗" }, status: 422
        end
   end

   def push_time
    render json: {message: "ok"}
    time = User.new(user_params)
    if time.save
        render json: time
    else
        render json: {message: "エラー出てるよ"}
    end
   end

   
    private

    def user_params
      params.permit(:name)
    end
end