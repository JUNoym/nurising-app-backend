class Api::V1::GetUsersController < ApplicationController
    # before_action :authenticate_devise_user!

  def index
    render json: {
      data: {
        user: current_devise_user,
        res: DeviseUser.all
      }
    }, status: 200
  end

  def me
    user = DeviseUser.find(params[:id])
    render json: user
  end
end
