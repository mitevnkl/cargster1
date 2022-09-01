class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    filter
  end

  def profile
    @user = current_user
  end

  def myposts
    @posts = Post.where(user: current_user).paginate(:page => params[:page], per_page: 10).order(created_at: :desc)
    filter
  end

  def filter
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  def change_status
    @post = Post.find(params[:id])
    @post.update!(status: false)
    redirect_to post_path(@post), flash: {notice: "Staus changed!"}
  end

  private

  # A list of the param names that can be used for filtering the Posts list
  def filtering_params(params)
    params.slice(:load_date, :load_c, :unload_c, :truck_type)
  end
end
