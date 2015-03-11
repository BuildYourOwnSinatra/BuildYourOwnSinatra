FactoryGirl.define do
  factory :purchase do
    price 20
  end

  factory :purchase_with_user, parent: :purchase do
    user
  end

  factory :purchase_with_package, parent: :purchase do
    after(:create) do |purchase|
      purchase.packages << FactoryGirl.create(:package, purchase: purchase)
    end
  end

  factory :purchase_with_screencast_package, parent: :purchase do
    after(:create) do |purchase|
      purchase.packages << FactoryGirl.create(:package_with_screencast)
    end
  end
end
