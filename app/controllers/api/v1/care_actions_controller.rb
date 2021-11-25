class Api::V1::CareActionsController < ApplicationController
  def index
    care_action = CareAction.all
    render json: care_action
  end

  def create
    care_action = CareAction.new(care_action_param)
    if care_action.save
      render json: care_action
    end
  end

  def care_action_param
    params.permit(:name)
  end
end
