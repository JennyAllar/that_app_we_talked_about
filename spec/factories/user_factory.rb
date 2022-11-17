FactoryBot.define do
  factory(:user) do
    name { Faker::Name.first_name }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end
