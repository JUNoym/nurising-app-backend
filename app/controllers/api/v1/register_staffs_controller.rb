class Api::V1::RegisterStaffsController < ApplicationController
    # エンドポイント　http://localhost:3030/api/v1/register_staffs
    def index
        user = RegisterStaff.all
        render json: user
    end

    def create
        user = RegisterStaff.new(user_param)
        user.save
        render json: { status: 201, user: user }
      rescue StandardError
        render json: { status: 422 }
    end

    private
        def user_param
            params.permit(
                :name, :have_work, :work_in, :work_out
            )
        end
end
  