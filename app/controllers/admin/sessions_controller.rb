class Admin::SessionsController < ApplicationController

  layout 'layouts/session'

  before_action :authorize,except:[:new,:create]

  def new
  end

  def create
  	admin = User.find_by(account: params[:session][:account].downcase)
	if admin && admin.authenticate(params[:session][:password])
		session[:current_admin_id] = admin.id
		redirect_to admin_posts_url
	else
		flash.now[:danger] = "错误，请重新输入。"
		render 'new'
	end
  end

  def destroy
  	session[:current_admin_id] = nil
  	redirect_to root_url
  end
end
