class User < ApplicationRecord
  has_many :user_care_action,through: :care_action
  has_many :care_action
end
