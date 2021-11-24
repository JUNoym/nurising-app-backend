class Api::V1::UserCareActionsController < ApplicationController
  def index
    users = User.all
    res = users.map{ |user|
      {"user_name"=>user.name,"user_id"=>user.id,"care_actions"=>user.care_action}
    }
    render json: res
  end
  def create
    care_action = CareAction.find(params[:care_action_id])
    puts care_action
    puts "hoeghoge"

    user = User.find(params[:user_id])
    puts user
    user_care_action = user.user_care_action.new(user_id:user.id,care_action_id:care_action.id)
    if user_care_action.save!
      care_actions = user.care_action
      render json: care_actions
    end
  end

  def fetch_care_actions_by_user
    user = User.find(params[:id])
    care_actions = user.care_action
    render json: {care_actions:care_actions}
  end

end
