class Api::V1::ArchivesController < ApplicationController
    def index
        excretion_user = User.all
        vital_user = VitalUser.all
        render json: {excretion_user:excretion_user, vital_user:vital_user}
    end

    # 日付で検索
    def search
        type = params[:type]
        case type
        when "name" then
            search_user_by_name
        when "date" then
            search_by_date
        end
    end

    private
    def search_user_by_name
        vital_users = VitalUser.where("name LIKE ?", "%#{params[:name]}%")
        users = User.where(["name LIKE ? ", "%#{params[:name]}%"])
        excretion_users = users.map{ |user|
            user_care_actions = UserCareAction.where(user_id:user.id)
            care_actions = user_care_actions.map{ |action|
                care_action = CareAction.find(action.care_action_id)
                next {"id" => care_action.id, "title" => care_action.name, "registered_at" => action.updated_at}
            }
            next {"user_name"=>user.name,"user_id"=>user.id,"care_actions"=>care_actions}
        }
        response = [] #user_id,user_name,info
        response = vital_users.map{ |vital_user|
            {"type"=>"vital","user_name"=>vital_user.name,"info":{"kt"=>vital_user.kt,"bp"=>vital_user.bp,"plus"=>vital_user.plus,"spo2"=>vital_user.spo2}}
        }
        puts excretion_users
        response += excretion_users.map{ |excretion_user|
            {"type"=>"excretion","user_name"=>excretion_user["user_name"],"info":{"care_actions"=> excretion_user["care_actions"]}}
        }

        render json: {result:response}
    end

    def search_by_date
        query_time = Time.parse(params[:created_at])
        day = query_time.all_day
        vital_users = VitalUser.where(created_at: day)
        user_care_actions = UserCareAction.where(created_at: day)
        excretion_users = user_care_actions.map {|care_action|
            user = care_action.user
            puts user.name
            puts "testtest"
            next {"type":"excretion",user_name:user.name,info:{"care_actions"=>[care_action]}}
        }
        response = []
        response = vital_users.map{ |vital_user|
            {"type"=>"vital","user_name"=>vital_user.name,"info":{"kt"=>vital_user.kt,"bp"=>vital_user.bp,"plus"=>vital_user.plus,"spo2"=>vital_user.spo2}}
        }
        puts excretion_users
        response += excretion_users
        render json: {result:response}
    end
end