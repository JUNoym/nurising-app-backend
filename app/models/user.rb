class User < ApplicationRecord
  has_many :user_care_action
  has_many :care_action ,through: :user_care_action
end
