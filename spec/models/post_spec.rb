require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:title).of_type(:string)}
    it {should have_db_column(:body).of_type(:text)}
    it { is_expected.to have_many(:labelings) }
    it { is_expected.to have_many(:labels).through(:labelings) }
  end
  
  describe 'associations' do
    it {should have_many(:comments).dependent(:destroy)}
    it {should belong_to(:topic)}
  end
  
  describe 'validations' do
    # title
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    # body
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(20) }
    # topic
    it { is_expected.to validate_presence_of(:topic) }
  end
end
