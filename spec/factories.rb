FactoryGirl.define do

  factory :user do
    email "user1@mail.com"
    full_name "User"
    password "1q2w3e4r"
    admin false
  end

  factory :admin_user, :parent => :user do
    email "admin@mail.com"
    full_name "Admin"
    password "1q2w3e4r"
    admin true
  end


  factory :event_type do
    name "event_type"
    title 'event type'
    description 'Event type description'
  end

end