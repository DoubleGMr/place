class StaticPagesController < ApplicationController

  before_action :message_send

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
    @post_last = Post.last(3)
    ip = request.remote_ip
    if !View.find_by(ip: ip)
      View.create!(ip: ip)
    end
  end

  def about
  	@about = About.first
  end

  private

  def message_send
  	@message = Message.new
  end
end
