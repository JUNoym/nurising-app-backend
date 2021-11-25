class VitalUser < ApplicationRecord
    has_many :vital_contents, dependent: :destroy
end
