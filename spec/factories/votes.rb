FactoryGirl.define do
   pw = RandomData.random_sentence
   factory :vote do
     name RandomData.random_name
     sequence(:email){|n| "vote#{n}@factory.com" }
     password pw
     password_confirmation pw
     role :member
   end
 end