require 'rails_helper'

RSpec.describe LabelsController, type: :controller do
   let(:my_label) { Label.create!(name: "L1") }
 
   describe "GET show" do
     it "returns http success" do
       get :show, { id: my_label.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #show view" do
       get :show, { id: my_label.id }
       expect(response).to render_template :show
     end
 
    it "assigns my_label to @label" do
      get :show, { id: my_label.id }
      expect(assigns(:label)).to eq(my_label)
    end
   end
   
   describe "not signed in" do
     
     let(:factory_label) { create(:label) }
 
     before do
       post :create, label: new_label_attributes
     end
 
     it "returns http success" do
       get :show, {id: factory_label.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #show view" do
       get :show, {id: factory_label.id}
       expect(response).to render_template :show
     end
 
     it "assigns factory_user to @label" do
       get :show, {id: factory_label.id}
       expect(assigns(:label)).to eq(factory_label)
     end
   end
end
