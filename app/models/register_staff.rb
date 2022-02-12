class RegisterStaff < ApplicationRecord
    def format_staff_data
        "#{name}さんの出勤状態は #{have_work}です。 "
    end
end
