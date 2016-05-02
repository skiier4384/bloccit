require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) {Advertisement.create!}
  
  describe "attributes" do
    it {should have_db_column(:title).of_type(:string)}
    it {should have_db_column(:copy).of_type(:text)}
    it {should have_db_column(:price).of_type(:integer)}
  end
end