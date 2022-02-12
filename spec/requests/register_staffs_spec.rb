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

  describe 'POST request' do
    describe 'success' do
      it '出勤スタッフのユーザーが登録できる' do
        params = {
          name: 'test',
          have_work: 'true',
          work_in: '18:00',
          work_out: '9:00'
        }
        post '/api/v1/register_staffs', params: params
        json = JSON.parse(response.body)
        expect(json['status']).to eq(201)
        expect(json['user']['name']).to eq('test')
        expect(json['user']['have_work']).to eq(true)
      end
    end
  end
end
