class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'layouts/admin'

  before_action :authorize

  def current_admin
		@admin ||= User.find(session[:current_admin_id]) if session[:current_admin_id]
	end

	def authorize
		@tags = Tag.all
		unless current_admin
			redirect_to admin_url, alert: '管理员空间,请先登陆.'
		end
	end
end
