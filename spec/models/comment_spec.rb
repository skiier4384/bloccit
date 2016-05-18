require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:body).of_type(:text)}
  end
  
  describe 'associations' do
    it {should belong_to(:post)}
    it { should belong_to(:user) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(5) }
  end
  
  describe "after_create" do
     before do
       topic = Topic.create!(name: "Things", description: "All sorts of things.")
       @user = User.create!(name: "Example", email: "example@example.com", password: "Example")
       @post = Post.create!(title: "Long and texty", body: "Lots to talke about today so exciting.", topic: topic, user: @user)
       @new_comment = Comment.new(body: 'Comment Body', post: @post, user: @user)
       @another_comment = Comment.new(body: 'Comment Body', post: @post, user: @user)
     end
 
     it "sends an email to users who have favorited the post" do
       @user.favorites.create(post: @post)
       expect(FavoriteMailer).to receive(:new_comment).with(@user, @post, @another_comment).and_return(double(deliver_now: true))
       @another_comment.save!
     end
 
     it "does not send emails to users who haven't favorited the post" do
       expect(FavoriteMailer).not_to receive(:new_comment)
       @another_comment.save!
     end
   end
end
