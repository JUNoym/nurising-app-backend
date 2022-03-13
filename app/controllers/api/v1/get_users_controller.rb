class Api::V1::GetUsersController < ApplicationController
    before_action :authenticate_devise_user!

  def index
    render json: {
      data: {
        user: current_devise_user 
      }
    }, status: 200
  end
end
