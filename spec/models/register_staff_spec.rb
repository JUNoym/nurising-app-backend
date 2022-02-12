require 'rails_helper'

RSpec.describe RegisterStaff, type: :model do
  it "出勤するスタッフを登録することができる" do
    user = RegisterStaff.new(name: "武田", have_work: true, work_in: "2022-02-12 19:07:28.204208", work_out: "2022-02-12 21:07:28.204208")
    expect(user.format_staff_data).to eq "武田さんの出勤状態は trueです。 "
  end
end