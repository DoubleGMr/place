class MessagesController < ApplicationController
  def create
  	@message = Message.new(message_params)
  	if @message.save
  		flash[:success] = "信件投递成功，将尽快回复。"
  	else
  		flash[:danger] = "未正确填写内容，请重试。"
  	end
  	redirect_back(fallback_location: root_url)
  end

  private

  def message_params
  	params.require(:message).permit(:name,:email,:content)
  end
end