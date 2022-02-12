class Api::V1::RegisterStaffsController < ApplicationController
    def index
        user = RegisterStaff.all
        render json: user
    end

    def create
        user = RegisterStaff.new(user_param)
        user.save
        render json: { status: 201, user: user }
    end

    private
        def user_param
            params.permit(
                :name, :have_work, :work_in, :work_out
            )
        end
end
  