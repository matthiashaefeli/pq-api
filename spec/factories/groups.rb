FactoryBot.define do
  factory :group do
    title { "MyString" }
    admin_id { 1 }
    public { false }
    password { "MyString" }
  end
end
