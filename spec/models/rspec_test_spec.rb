require 'rails_helper'

RSpec.describe RspecTest, type: :model do
  it "姓、名を登録すると、姓名が取得できること" do
    rspec_test = RspecTest.new(first_name: "山田", last_name: "太郎")
    expect(rspec_test.full_name).to eq "山田 太郎"
  end
end
