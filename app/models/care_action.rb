class CareAction < ApplicationRecord
  has_many :user_care_action,through: :user
  has_many :user
  accepts_nested_attributes_for :user_care_action
end
