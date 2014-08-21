class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    render :new
  end

  def create
    new_post = params[:post].permit(:name, :author, :content)
    my_post = Post.create(new_post)

    new_tag = params[:tag].permit(:name)
    my_tag = Tag.find_or_create_by(name: new_tag[:name])

    my_post.tags << my_tag

    redirect_to '/posts'
  end

  def show
    id = params[:id]
    @post = Post.find(id)
  end

  def destroy
    id = params[:id]
    @post = Post.find(id)
    @post.destroy

    redirect_to '/posts'
  end




end
