  class Api::V1::PostsController < Api::V1::BaseController
   
   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]
 
   def index
     posts = Post.all
     render json: posts, status: 200
   end
 
   def show
     topic = Topic.find(params[:id])
     post = topic.posts.build(post_params)
     render json: post, status: 200
   end
   
   def update
    post = Post.find(params[:id])
    
     if post.update_attributes(post_params)
       render json: post, status: 200
     else
       render json: {error: "Post update failed", status: 400}, status: 400
     end
   end

   def create
    topic = Topic.find(params[:topic_id])
    puts topic.name
    post = Post.new
    post =  topic.posts.build(post_params)
    post.user = @current_user
 
     if post.valid?
       post.save!
       render json: post, status: 201
     else
       render json: {error: "Post is invalid", status: 400}, status: 400
     end
   end
 
   def destroy
    post = post.find(params[:id])
 
     if post.destroy
       render json: {message: "Post destroyed", status: 200}, status: 200
     else
       render json: {error: "Post destroy failed", status: 400}, status: 400
     end
   end
   
   private
   
   def post_params
     params.require(:post).permit(:title, :body)
   end
 end