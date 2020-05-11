class BlogsController < ApplicationController

  def show
  	@blog = Blog.find(params[:id])
  end

  def index
  	#記事を全件取得
  	@blogs = Blog.all
  end

  def new
  	@blog = Blog.new #空のモデル
  	# インタンス変数を書いた空モデルを渡すと、フォームとBlogモデルが関連づけられる
  end

  def create
  	blog = Blog.new(blog_params)
  	blog.save
  	redirect_to blog_path(blog.id)
  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end


  private
  # Strong Parametersを定義
  def blog_params
  	params.require(:blog).permit(:title, :category, :body)
  end

end
