class Api::V1::VitalUsersController < ApplicationController
    def index
        vital_user = VitalUser.all
        render json: vital_user
    end

    def create
        vital_user = VitalUser.new(vital_user_param)
        if vital_user.save
        render json: vital_user
        else
        render json: vital_user.errors, status: :unprocessable_entity
        end
    end

    def show
        user = VitalUser.find(params[:id])
        render json: user
    end

    def update
        user = VitalUser.find(params[:id])
        if user.update(vital_user_param)
        render json: user
        else
        render json: user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        user = VitalUser.find(params[:id])
        if user.destroy
        head :no_content
        else
        render json: user.errors, status: :unprocessable_entity
        end
    end

    def destroy_all
        if VitalUser.destroy_all
        head :no_content
        else
        render json: {message: "エラー出てるよ"}
        end
    end

    private

        def vital_user_param
          params.permit(:name)
        end
        # テスト
end