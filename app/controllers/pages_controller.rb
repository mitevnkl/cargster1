class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:truck_type].present?
      @posts = Post.where(truck_type: params[:truck_type]).order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end
end
