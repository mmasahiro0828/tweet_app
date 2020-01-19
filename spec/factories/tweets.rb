FactoryBot.define do
    factory :tweet do
        description { "テストの準備をする" }
        user
    end
end