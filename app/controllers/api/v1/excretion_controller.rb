class Api::V1::ExcretionController < ApplicationController
    def index
        user = Excretion.all
        render json: user
    end

    def show
        user = Excretion.find(params[:id])
        render json: user
    end

   def create
        user = Excretion.new(user_params)
        if user.save
            render json: user
        else
            render json: {message: "エラー出てるよ"}
        end
   end

   def update
        user = Excretion.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: {message: "エラー出てるよ"}
        end
   end

   def destroy
        if Excretion.destroy(params[:id])
            head :no_content
        else
            render json: {message: "エラー出てるよ"}
        end
   end

   
        private

        def user_params
            params.require(:excretion).permit(:name)
        end
end