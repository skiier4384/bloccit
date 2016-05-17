FactoryGirl.define do
   pw = RandomData.random_sentence
   factory :comment do
     name RandomData.random_name
     sequence(:email){|n| "comment#{n}@factory.com" }
     password pw
     password_confirmation pw
     role :member
   end
 end