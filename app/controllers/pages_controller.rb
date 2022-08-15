class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.where(nil)
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  private

  # A list of the param names that can be used for filtering the Posts list
  def filtering_params(params)
    params.slice(:load_date, :load_c, :unload_c, :truck_type)
  end
end
