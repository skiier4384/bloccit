class PostsController < ApplicationController
  
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create, :destroy]
  before_action :authorize_destroy, only: [:destroy]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user
    
    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
 
    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was updated successfully."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
  
   def destroy
     @post = Post.find(params[:id])
 
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end
   
   # remember to add private methods to the bottom of the file. Any method defined below private, will be private.
   private
   
   def post_params
     params.require(:post).permit(:title, :body)
   end
   
   def authorize_user
     post = Post.find(params[:id])
     
     unless current_user == post.user || current_user.admin? || current_user.moderator?
       flash[:alert] = "You are not authorized to do this."
       redirect_to [post.topic, post]
     end
   end
   
   def authorize_destroy
     post = Post.find(params[:id])
     
     unless current_user == post.user || current_user.admin?
       flash[:alert] = "You are not authorized to destroy posts."
       redirect_to [post.topic, post]
     end
   end
end
