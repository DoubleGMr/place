class Admin::PostsController < Admin::ApplicationController
  def index
    @tag = params[:tag]
    @search = params[:search]
    if params[:sort].nil?
      if @tag
        @posts = Post.includes(:tag).where(tags: {name: @tag}).order(id: :desc)
      elsif @search
          @posts = Post.where("title LIKE ?","%#{@search}%").order(id: :desc)
          if @posts.count == 0
            flash.now[:danger] = "没有类似的贴文."
          end
      else
        @posts = Post.order(id: :desc)
      end
    else
      @order = (params[:sort] == '1' ? 'asc' : 'desc')
      if @tag
        @posts = Post.includes(:tag).where(tags: {name: @tag}).order(id: :"#{@order}")
      elsif @search
        @posts = Post.where("title LIKE ?","%#{@search}%").order(id: :"#{@order}")
        if @posts.count == 0
            flash.now[:danger] = "没有类似的贴文."
        end    
      else
        @posts = Post.order(id: :"#{@order}")
      end
    end
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:success] = "#{@post.title}的相关内容创建成功。"
  		redirect_to admin_post_url(@post)
  	else
  		flash[:danger] = "创建失败，请检查内容。"
  		redirect_to admin_posts_url
  	end
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(post_params)
  		flash[:success] = "#{@post.title}的相关内容更新成功。"
  		redirect_to admin_post_url(@post)
  	else
  		flash[:danger] = "更新失败，请检查内容。"
  		redirect_to admin_post_url(@post)
  	end
  end

  def destroy
  	Post.find(params[:id]).destroy
  	flash[:success]="删除成功。"
  	redirect_to admin_posts_url
  end

  private

  def post_params
  	params.require(:post).permit(:title,:location,:content,:tag_id,:publish,:banner,:video,:img)
  end
end
