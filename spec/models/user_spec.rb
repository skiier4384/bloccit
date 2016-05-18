require 'rails_helper'

RSpec.describe User, type: :model do

  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:email).of_type(:string)}
    it {should have_db_column(:name).of_type(:string)}
    it {should have_db_column(:password_digest).of_type(:string)}
    it {should have_db_column(:role).of_type(:integer).with_options({default: 0, null: false})}
    it {should define_enum_for(:role).with([:member, :admin])}
  end
  
  describe 'associations' do
    it {should have_many(:posts)}
    it {should have_many(:comments)}
    it {should have_many(:votes)}
    it {should have_many(:favorites)}
  end
  
  describe 'validations' do
    # Shoulda tests for name
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1) }
    # Shoulda tests for email
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:email).is_at_least(3) }
    it { should allow_value("user@bloccit.com").for(:email) }
    # Shoulda tests for password
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
    it { should validate_length_of(:password).is_at_least(6) }
  end
  
  describe "#favorite_for(post)" do
     before do
       @user = User.create!(name: "Example", email: "example@example.com", password: "Example")
       topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
       @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @user)
     end
 
     it "returns `nil` if the user has not favorited the post" do
       expect(@user.favorite_for(@post)).to be_nil
     end
 
     it "returns the appropriate favorite if it exists" do
       favorite = @user.favorites.where(post: @post).create
       expect(@user.favorite_for(@post)).to eq(favorite)
     end
   end
end
