class Api::V1::ArchivesController < ApplicationController
    def index
        excretion_user = User.all
        vital_user = VitalUser.all
        render json: {excretion_user:excretion_user, vital_user:vital_user}
    end

    # 日付で検索
    def search
        @create_at = params[:created_at]
        @vital_user = VitalUser.where(["created_at LIKE ? ", "%#{create_at}%"])
        render json: @create_at
    end


    # localhost:3030/api/v1/archives/search_name?name=磯村
    def search_name
        @vital_user = VitalUser.where("name LIKE ?", "%#{params[:name]}%")
        users = User.where(["name LIKE ? ", "%#{params[:name]}%"])
        response = users.map{ |user|
            user_care_actions = UserCareAction.where(user_id:user.id)
            care_actions = user_care_actions.map{ |action|
                care_action = CareAction.find(action.care_action_id)
                next {"id" => care_action.id, "title" => care_action.name, "registered_at" => action.updated_at}
            }
            next {"user_name"=>user.name,"user_id"=>user.id,"care_actions"=>care_actions}
        }
        @excretion_user = response
        render json: {vital_user:@vital_user, excretion_user:@excretion_user}
    end
end