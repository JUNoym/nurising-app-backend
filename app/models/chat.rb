class Chat < ApplicationRecord
    belongs_to :auth_users, optional: true
end
