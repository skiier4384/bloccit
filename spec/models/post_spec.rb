require 'rails_helper'

RSpec.describe Post, type: :model do
  
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph }
   let(:topic) { Topic.create!(name: name, description: description) }
   
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: title, body: body, user: user) }
   
   it { is_expected.to have_many(:labelings) }
   it { is_expected.to have_many(:labels).through(:labelings) }
   
   it { is_expected.to have_many(:comments) }
   it { is_expected.to belong_to(:topic) }
   it { is_expected.to belong_to(:user) }
   
   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_presence_of(:topic) }
   it { is_expected.to validate_presence_of(:user) }
end
