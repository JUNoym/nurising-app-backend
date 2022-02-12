require 'rails_helper'

RSpec.describe "RegisterStaffs", type: :request do
  describe 'GET request' do
    describe 'success' do
        it '出勤スタッフのユーザーが取得できる' do

            get '/api/v1/register_staffs'
            json = JSON.parse(response.body)

            expect(response.status).to eq(200)
        end
    end 
  end
end
