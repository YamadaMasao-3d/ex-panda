FactoryBot.define do
  factory :favorite do
    after(:build) do |favorite|
      favorite.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name                { 'テストアイテム' }
    content             { 'aaaaaaaaaaaaaa' }
    period              { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    association :user
  end
end
