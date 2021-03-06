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
      rescue => e
        render json: { status: 422 , message: e.message}
    end

    def destroy
        if RegisterStaff.destroy(params[:id])
            head :no_content
        else
            render json: { message: "エラー出てるよ" }
        end
    end

    def update_status
        user = RegisterStaff.find(params[:id])
        if user.update(have_work: params[:have_work])
            render json: user
        else
            render json: {message: "エラー出てるよ"}
        end
    end

    private
        def user_param
            params.permit(
                :name, :have_work, :work_in, :work_out
            )
        end
end
  