require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:email).of_type(:string)}
    it {should have_db_column(:name).of_type(:string)}
    it {should have_db_column(:password_digest).of_type(:string)}
  end
  
  describe 'associations' do

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

  describe 'callbacks' do
    it "should format at the user's name" do
      @user = User.new(name: "bloc user", email: "bloc@example.com", password: "hellworld", password_confirmation: "hellworld") 
      expect { @user.save }.to change{@user.name}.from("bloc user").to("Bloc User")
    end
  end

end
