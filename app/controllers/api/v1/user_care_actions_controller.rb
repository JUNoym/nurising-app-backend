class Api::V1::UserCareActionsController < ApplicationController
  def create
    care_action = CareAction.find(params[:care_action_id])
    puts care_action
    puts "hoeghoge"

    user = User.find(params[:user_id])
    puts user
    user_care_action = user.user_care_action.new(user_id:user.id,care_action_id:care_action.id)
    if user_care_action.save!
      render json: user_care_action
    end
  end
end
