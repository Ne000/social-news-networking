class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end
  
  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts #see model:  @posts variable scoped for @topic
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end
  
  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end
  
  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :description))
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved." #why not use flash[:notice]
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description))
      redirect_to @topic  
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :edit
    end
  end
end
