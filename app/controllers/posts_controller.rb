class PostsController < ApplicationController
  def new
    @post = Post.new
    @countries = ["MK - Macedonia",
                  "AL - Albania",

  ]
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.status = true
    if @post.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def post_params
    params.require(:post).permit(:load_date, :unload_date, :length, :weight, :load_address, :unload_address, :description, :truck_type, :adr, :price, :load_city, :unload_city, :load_country, :unload_country)
  end

end
