class PostsController < ApplicationController
  def new
    @post = Post.new
    @countries = ["Albania", "Macedonia", "Bulgaria", "Serbia", "Bosnia"]
    @truck_types = ["Церада", "Тандем", "Фриго", "Контејнер", "Платформа"]
  end

  def create
    @van = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:load_date, :unload_date, :length, :weight, :load_address, :unload_address, :description, :truck_type, :adr, :price, :load, :load_city, :unload_city, :load_country, :unload_country)
  end
end
