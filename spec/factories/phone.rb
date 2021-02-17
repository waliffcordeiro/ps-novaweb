FactoryBot.define do
  factory :phone do
    association :contact, factory: :contact
    phone_number {'(61) 98182-9972'}
  end
end