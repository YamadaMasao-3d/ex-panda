FactoryBot.define do
  factory :want do
    after(:build) do |want|
      want.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name                {"テストアイテム"}
    content             {"aaaaaaaaaaaaaa"}
    association :user
  end
end