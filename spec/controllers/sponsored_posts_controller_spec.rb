require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
     
  #let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
     #12
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
     #13
   let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

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
     get :show, topic_id: my_topic.id, id: my_sponsored_post.id
     expect(response).to have_http_status(:success)
   end
   
   it "renders the #show view" do
     # #16
     get :show, topic_id: my_topic.id, id: my_sponsored_post.id
     expect(response).to render_template :show
   end

   it "assigns my_sponsored_post to @sponsored_post" do
     # #17
     get :show, topic_id: my_topic.id, id: my_sponsored_post.id
     expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
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
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "SPONSORED POST create" do
    it "increases the number of Post by 1" do
      expect{sponsored_post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(SponsoredPost, :count).by(1)
    end

    it "assigns the new post to @post" do
      sponsored_post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end
    
    it "redirects to the new post" do
      sponsored_post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

    describe "GET edit" do
      it "returns http success" do
       # #25
       get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
       expect(response).to have_http_status(:success)
      end
  
      it "renders the #edit view" do
        # #26
       get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
 # #1
       expect(response).to render_template :edit
      end
 
 # #2
      it "assigns sponsored_post to be updated to @sponsored_post" do
       # #27
       get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
 
       sponsored_post_instance = assigns(:sponsored_post)
 
       expect(sponsored_post_instance.id).to eq my_sponsored_post.id
       expect(sponsored_post_instance.title).to eq my_sponsored_post.title
       expect(sponsored_post_instance.body).to eq my_sponsored_post.body
      end
    end
    
    describe "PUT update" do
     it "updates sponsored_post with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       # #28
       put :update, topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body}
 
 # #3
       updated_sponsored_post = assigns(:sponsored_post)
       expect(updated_sponsored_post.id).to eq my_sponsored_post.id
       expect(updated_sponsored_post.title).to eq new_title
       expect(updated_sponsored_post.body).to eq new_body
     end
 
     it "redirects to the updated sponsored post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       
 # #29
       put :update, topic_id: my_topic.id, id: my_sponsored_post.id,sponsored_post: {title: new_title, body: new_body}
 # #30
       expect(response).to redirect_to [my_topic, my_sponsored_post]
     end
   end
   
   describe "DELETE destroy" do
     it "deletes the sponsored_post" do
 # #31
       delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id
       
       count = SponsoredPost.where({id: my_sponsored_post.id}).size
       expect(count).to eq 0
     end

     it "redirects to topic show" do
 # #32
       delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id
 # #33
       expect(response).to redirect_to my_topic
     end
   end

  describe "GET edit" do
     it "returns http success" do
 # #25
       get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
 # #26
       get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
       expect(response).to render_template :edit
     end

     it "assigns sponsored_post to be updated to @sponsored_post" do
 # #27
       get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
       sponsored_post_instance = assigns(:sponsored_post)

       expect(sponsored_postpost_instance.id).to eq my_sponsored_post.id
       expect(sponsored_postpost_instance.title).to eq my_sponsored_post.title
       expect(sponsored_postpost_instance.body).to eq my_sponsored_post.body
     end
   end
 end