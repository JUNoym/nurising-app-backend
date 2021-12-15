class Api::V1::UserCareActionsController < ApplicationController
  def index
    users = User.all
    response = users.map{ |user|
      # user_idに紐づく中間テーブル（UserCareAction）の一覧を取得
      user_care_actions = UserCareAction.where(user_id:user.id)
      care_actions = user_care_actions.map{ |action|
        # UserCareActionそれぞれについて、care_action_idから、CareActionの情報を取得
        care_action = CareAction.find(action.care_action_id)
        next {"id" => care_action.id, "title" => care_action.name, "registered_at" => action.updated_at}
      }
      next {"user_name"=>user.name,"user_id"=>user.id,"care_actions"=>care_actions}
    }
    render json: {"user_care_actions" => response}
  end

  def destroy_all
    users = User.all
    if users.destroy_all
      render json: {message: "削除完了"}
    else
      render json: {message: "エラー出てるよ"}
    end

  end

  def create
    care_action = CareAction.find(params[:care_action_id])

    user = User.find(params[:user_id])
    user_care_action = user.user_care_action.new(user_id:user.id,care_action_id:care_action.id)
    if user_care_action.save
      render json: user_care_action
    end
  end

  def fetch_care_actions_by_user
    user = User.find(params[:id])
    care_actions = user.care_action
    render json: {care_actions:care_actions}
  end

end