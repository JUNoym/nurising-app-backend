class UserCareAction < ApplicationRecord
  belongs_to :user
  belongs_to :care_action
end
