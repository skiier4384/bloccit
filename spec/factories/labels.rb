FactoryGirl.define do
   pw = RandomData.random_sentence
   factory :label do
     name RandomData.random_name
     sequence(:email){|n| "label#{n}@factory.com" }
     password pw
     password_confirmation pw
     role :member
   end
 end