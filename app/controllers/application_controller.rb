class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :tag_all

  def tag_all
  	@tags = Tag.all
  end
end
