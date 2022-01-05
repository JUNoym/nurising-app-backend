class  Api::V1::RegistrationsController < ApplicationController

    def index
        @user = Login.all
        render json: @user
    end
    
    def signup
        @user = Login.new(registrations_params)
        if @user.save
            login!
            render json: { user: @user }
        else
            render json: { errors: @user.errors.full_messages }
        end
    end

    private

        def registrations_params
            params.permit(:email, :password, :password_confirmation)
        end

end