class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @load_posts = Post.where(load: true).order(created_at: :desc)
    @truck_posts = Post.where(truck: true).order(created_at: :desc)
  end
end
