FactoryGirl.define do
  factory :food do
    category_id { [1 , 2, 3].sample }
    type_id { [1 , 2, 3].sample }
    user_id 1
    time_consumed "2016-09-21 10:39:02"
  end
end
