require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
     
  #let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
     #12
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
     #13
   let(:my_sponsoredpost) { my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  #describe "GET index" do
   #it "returns http success" do
    # get :index
    # expect(response).to have_http_status(:success)
  # end
   
  # it "assigns [my_post] to @posts" do
   #  get :index
   #  expect(assigns(:posts)).to eq([my_post])
  # end
  #end

  describe "GET show" do
   it "returns http success" do
     # #15
     get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
     expect(response).to have_http_status(:success)
   end
   
   it "renders the #show view" do
     # #16
     get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
     expect(response).to render_template :show
   end

   it "assigns my_sponsoredpost to @sponsoredpost" do
     # #17
     get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
     expect(assigns(:sponsoredpost)).to eq(my_sponsoredpost)
   end
  end

  describe "GET new" do
    it "returns http success" do
      # #18
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      # #19
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      # #20
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "SPONSORED POST create" do
    it "increases the number of Post by 1" do
      # #21
      expect{sponsoredpost :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
    end

    it "assigns the new post to @post" do
      # #22
      sponsoredpost :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:sponsoredpost)).to eq SponsoredPost.last
    end
    
    it "redirects to the new post" do
 # #23
      sponsoredpost :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
 # #24
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

    describe "GET edit" do
      it "returns http success" do
       # #25
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
       expect(response).to have_http_status(:success)
      end
  
      it "renders the #edit view" do
        # #26
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
 # #1
       expect(response).to render_template :edit
      end
 
 # #2
      it "assigns sponsoredpost to be updated to @sponsoredpost" do
       # #27
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
 
       sponsoredpost_instance = assigns(:sponsoredpost)
 
       expect(sponsoredpost_instance.id).to eq my_sponsoredpost.id
       expect(sponsoredpost_instance.title).to eq my_sponsoredpost.title
       expect(sponsoredpost_instance.body).to eq my_sponsoredpost.body
      end
    end
    
    describe "PUT update" do
     it "updates sponsoredpost with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       # #28
       put :update, topic_id: my_topic.id, id: my_sponsoredpost.id, sponsoredpost: {title: new_title, body: new_body}
 
 # #3
       updated_sponsoredpost = assigns(:sponsoredpost)
       expect(updated_sponsoredpost.id).to eq my_sponsoredpost.id
       expect(updated_sponsoredpost.title).to eq new_title
       expect(updated_sponsoredpost.body).to eq new_body
     end
 
     it "redirects to the updated sponsored post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       
 # #29
       put :update, topic_id: my_topic.id, id: my_sponsoredpost.id,sponsoredpost: {title: new_title, body: new_body}
 # #30
       expect(response).to redirect_to [my_topic, my_sponsoredpost]
     end
   end
   
   describe "DELETE destroy" do
     it "deletes the sponsoredpost" do
 # #31
       delete :destroy, topic_id: my_topic.id, id: my_sponsoredpost.id
       
       count = SponsoredPost.where({id: my_sponsoredpost.id}).size
       expect(count).to eq 0
     end

     it "redirects to topic show" do
 # #32
       delete :destroy, topic_id: my_topic.id, id: my_sponsoredpost.id
 # #33
       expect(response).to redirect_to my_topic
     end
   end

  describe "GET edit" do
     it "returns http success" do
 # #25
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
 # #26
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
       expect(response).to render_template :edit
     end

     it "assigns sponsoredpost to be updated to @sponsoredpost" do
 # #27
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
       sponsoredpost_instance = assigns(:sponsoredpost)

       expect(sponsoredpostpost_instance.id).to eq my_sponsoredpost.id
       expect(sponsoredpostpost_instance.title).to eq my_sponsoredpost.title
       expect(sponsoredpostpost_instance.body).to eq my_sponsoredpost.body
     end
   end
 end