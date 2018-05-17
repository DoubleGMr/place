class Admin::MessagesController < Admin::ApplicationController
  def index
  	@messages = Message.all.order(id: :desc)
  	@post = Post.new
  end

  def destroy
  	Message.find(params[:id]).destroy
  	flash[:success] = "信件删除成功。"
  	redirect_to admin_messages_url
  end
end
