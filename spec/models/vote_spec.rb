require 'rails_helper'

RSpec.describe Vote, type: :model do
   #let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   #let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   #let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   let(:topic) { create(:topic) }
   let(:user) { create(:user) }
   let(:post) { create(:post) }
   let(:vote) { Vote.create!(value: 1, post: post, user: user) }
 
   it { is_expected.to belong_to(:post) }
   it { is_expected.to belong_to(:user) }
   it { is_expected.to validate_presence_of(:value) }
   it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }
   
   describe "update_post callback" do
     it "triggers update_post on save" do
       expect(vote).to receive(:update_post).at_least(:once)
       vote.save!
     end
 
     it "#update_post should call update_rank on post " do
       expect(post).to receive(:update_rank).at_least(:once)
       vote.save!
     end
   end
   
   describe ".avatar_url" do
      
     let(:known_vote) { create(:vote, email: "blochead@bloc.io") }
 
     it "returns the proper Gravatar url for a known email entity" do
       expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
       expect(known_vote.avatar_url(48)).to eq(expected_gravatar)
     end
   end
end
