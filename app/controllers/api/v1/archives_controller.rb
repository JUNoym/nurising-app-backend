class Api::V1::ArchivesController < ApplicationController
    def index
        excretion_user = User.all
        vital_user = VitalUser.all
        render json: {excretion_user:excretion_user, vital_user:vital_user, result: "ok"}
    end

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
        vital_users = VitalUser.where("name LIKE ?", "%#{params[:q]}%")
        users = User.where(["name LIKE ? ", "%#{params[:q]}%"])
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
            {"type"=>"vital","user_name"=>vital_user.name,
                "info":{"kt"=>vital_user.kt + "°C","bp"=>vital_user.bp + "bp","plus"=>vital_user.plus + "/m","spo2"=>vital_user.spo2 + "%"},
                "time" => vital_user.created_at
            }
        }
        response += excretion_users.map{ |excretion_user|
            {"type"=>"excretion","user_name"=>excretion_user["user_name"],"info":{"care_actions"=> excretion_user["care_actions"]}}
        }

        render json: {result:response}
    end

    def search_by_date
        response = []
        # 日付を取得
        query_time = Time.parse(params[:q])
        day = query_time.all_day
        # バイタルデータを絞り込み
        vital_users = VitalUser.where(created_at: day)
        response = vital_users.map{ |vital_user|
            {"type"=>"vital","user_name"=>vital_user.name,
                "info":{"kt"=>vital_user.kt + "°C","bp"=>vital_user.bp + "bp","plus"=>vital_user.plus + "/m","spo2"=>vital_user.spo2 + "%"},
                "time" => vital_user.created_at
            }
        }

        # 排泄データを絞り込み
        excretion_users = User.where(created_at: day)

        users = excretion_users.map{ |user|
            user_care_actions = UserCareAction.where(user_id:user.id)
            care_actions = user_care_actions.map{ |action|
                care_action = CareAction.find(action.care_action_id)
                next {"id" => care_action.id, "title" => care_action.name, "registered_at" => action.updated_at}
            }
            next {"type"=>"excretion","user_name"=>user.name,"user_id"=>user.id,"care_actions"=>care_actions}
        }

        response += users.map{ |user|
            {"type"=>"excretion","user_name"=>user["user_name"],"info":{"care_actions"=> user["care_actions"]}}
        }
        render json: {result:response}
    end
end