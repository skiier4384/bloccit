require 'rails_helper'

RSpec.describe Comment, type: :model do
  #let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  #let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  #let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   let(:topic) { create(:topic) }
   let(:user) { create(:user) }
   let(:post) { create(:post) }
   let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }
 
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(5) }

  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:body).of_type(:text)}
  end
  
  describe 'associations' do
    it {should belong_to(:post)}
  end
  
  describe "after_create" do
     before do
       @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
     end
 
     it "sends an email to users who have favorited the post" do
       favorite = user.favorites.create(post: post)
       expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))
       @another_comment.save!
     end
 
     it "does not send emails to users who haven't favorited the post" do
       expect(FavoriteMailer).not_to receive(:new_comment)
       @another_comment.save!
     end
   end
   
   describe ".avatar_url" do
       
     let(:known_comment) { create(:comment, email: "blochead@bloc.io") }
     
     it "returns the proper Gravatar url for a known email entity" do
         
       expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
       expect(known_comment.avatar_url(48)).to eq(expected_gravatar)
     end
   end
end
