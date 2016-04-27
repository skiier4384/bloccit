require 'rails_helper'

RSpec.describe Answer, type: :model do

  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:body).of_type(:text)}
  end
  
  describe 'associations' do
    it {should belong_to(:question)}
  end
end
