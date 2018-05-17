class PostsController < ApplicationController

  before_action :message_send

  def show
  	@post = Post.find(params[:id])
  	ip = request.remote_ip
    if !Pview.find_by(ip: ip,post_id: @post.id)
      Pview.create!(ip: ip,post_id: @post.id)
    end
  end

  private

  def message_send
  	@message = Message.new
  end
end
