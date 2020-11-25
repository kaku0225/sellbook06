class PostsController < ApplicationController
  before_action :session_required, only:[:create, :edit, :update]
  
  def new
    @post = Post.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @post = current_user.posts.new(params_post)
    @post.book = @book

    if @post.save
      redirect_to @book, notice:'新增文章成功'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(params_post)
      redirect_to @post, notice:'編輯成功'
    else
      render :edit
    end
  end


  private
  def params_post
    params.require(:post).permit(:title, :content)
  end
end