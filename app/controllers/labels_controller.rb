class LabelsController < ApplicationController
  def show
    @label = Label.find(params[:id])
    @posts = @label.posts.visible_to(current_user)
  end
end
