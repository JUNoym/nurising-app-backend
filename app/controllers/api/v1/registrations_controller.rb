class RegistrationsController < ApplicationController

    def index
        render json: {status: 200}
    end
    def signup
        @user = Login.new(registrations_params)
        binding.pry

        if @user.save
            login!
            render json: { status: :created, user: @user }
        else
            render json: { status: 500 }
        end
    end

    private

        def registrations_params
            params.require(:login).permit(:email, :password, :password_confirmation)
        end

end