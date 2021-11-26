class Api::V1::VitalContentsController < ApplicationController

  def index
    vital_content = VitalContent.all
    render json: vital_content
  end

  def create
    user = VitalUser.find(params[:id])
    content = VitalContent.new(Vital_User_id:user.id,kt:params[:kt],bp:params[:bp],plus:params[:plus],spo2:params[:spo2],name:params[user.name])
    content.save
    render json: content
  end

  def show
    user = VitalUser.find(params[:id])
    render json: user
  end

  def destroy_all
    VitalContent.destroy_all
  end

  private
    def vital_content_param
      params.permit( :kt, :bp, :plus, :spo2, 
        :Vital_User_id, :id, :name
    )
    end
end
