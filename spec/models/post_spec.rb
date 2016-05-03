require 'rails_helper'

RSpec.describe Post, type: :model do
  
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph }
 # #3
   let(:topic) { Topic.create!(name: name, description: description) }
 # #4
   let(:post) { topic.posts.create!(title: title, body: body) }
 
   it { is_expected.to belong_to(:topic) }
 
  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:title).of_type(:string)}
    it {should have_db_column(:body).of_type(:text)}
    #expect(post).to have_attributes(title: title, body: body)
  end
  
  describe 'associations' do
    it {should have_many(:comments)}
    
  end
end
