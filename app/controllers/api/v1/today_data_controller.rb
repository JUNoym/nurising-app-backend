# class Api::V1::TodayDataController < ApplicationController
#     def index
#         excretion_user = User.all
#         vital_user = VitalUser.all
#         render json: {excretion_user:excretion_user, vital_user:vital_user}
#     end

#     def get_today_vital_data
#         render json: {status: "success", vital_user: VitalUser.where(created_at: Time.now.all_day)}
#     end

#     def get_today_excretion_data
#         users = User.where(created_at: Time.now.all_day)
#         response = users.map{ |user|
#         user_care_actions = UserCareAction.where(user_id:user.id)
#         care_actions = user_care_actions.map{ |action|
#             care_action = CareAction.find(action.care_action_id)
#             next {"id" => care_action.id, "title" => care_action.name, "registered_at" => action.updated_at}
#         }
#         next {"user_name"=>user.name,"user_id"=>user.id,"care_actions"=>care_actions}
#         }
#         render json: {"user_care_actions" => response}
#     end
# end