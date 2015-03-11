FactoryGirl.define do
  factory :package do
    price 20
    name  'package is awesome'
  end

  factory :package_with_screencast, parent: :package do
    after(:create) do |package|
      package.screencasts << FactoryGirl.create(:screencast)
    end
  end
end
