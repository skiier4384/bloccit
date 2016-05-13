require 'rails_helper'

RSpec.describe User, type: :model do
<<<<<<< HEAD
  
  describe "attributes" do #Documentation for shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
    it {should have_db_column(:email).of_type(:string)}
    it {should have_db_column(:name).of_type(:string)}
    it {should have_db_column(:password_digest).of_type(:string)}
  end
  
  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
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

=======
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
   
   it { is_expected.to have_many(:posts) }
   it { is_expected.to have_many(:comments) }
   it { is_expected.to have_many(:votes) }
   
   # Shoulda tests for name
   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }
 
   # Shoulda tests for email
   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
   it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it { is_expected.to allow_value("user@bloccit.com").for(:email) }
 
   # Shoulda tests for password
   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }
 
   describe "attributes" do
     it "should have name and email attributes" do
        expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
     end
     
     it "should format at the user's name" do
        user.name = "bloc user"
        user.save
        expect(user.name).to eq "Bloc User"
     end
     
     it "responds to role" do
       expect(user).to respond_to(:role)
     end
 
     it "responds to admin?" do
       expect(user).to respond_to(:admin?)
     end
 
     it "responds to member?" do
       expect(user).to respond_to(:member?)
     end
   end
>>>>>>> 43_checkpoint

end
