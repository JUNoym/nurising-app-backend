class CareAction < ApplicationRecord
  has_many :user_care_action
  has_many :user,through: :user_care_action
  accepts_nested_attributes_for :user_care_action
end
