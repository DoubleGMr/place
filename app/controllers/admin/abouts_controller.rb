class Admin::AboutsController < Admin::ApplicationController
  def index
  	if About.first
  		@about = About.first
  	else
  		@about = About.new
  	end
  	@post = Post.new
  end

  def create
  	@about = About.new(about_params)
  	if @about.save
  		flash[:success] = "信息创建成功。"
  	else
  		flash[:danger] = "信息创建失败，请重试。"
  	end
  	redirect_to admin_abouts_url
  end

  def update
  	@about = About.find(params[:id])
  	if @about.update_attributes(about_params)
  		flash[:sucess] = "信息更新成功。"
  	else
  		flash[:danger] = "信息更新失败，请重试。"
  	end
  	redirect_to admin_abouts_url
  end

  private

  def about_params
  	params.require(:about).permit(:content)
  end
end
