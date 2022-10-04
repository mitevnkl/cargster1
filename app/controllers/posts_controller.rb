class PostsController < ApplicationController

  def new
    @my_posts = Post.where(id: Post.group(:load_c, :unload_c, :truck_type, :load_city, :weight, :length, :description).select("min(id)"),user_id: current_user.id).paginate(:page => params[:page], per_page: 4)
    repost
    @countries = ["AL - Albania", "AD - Andorra", "AM - Armenia", "AT - Austria", "AZ - Azerbaijan", "BA - Bosnia and Herzegovina", "BE - Belgium", "BG - Bulgaria", "BY - Belarus", "CH - Switzerland", "CY - Cyprus", "CZ - Czech Republic", "DE - Germany", "DK - Denmark", "EE - Estonia", "ES - Spain", "FI - Finland", "FR - France", "GE - Georgia", "GR - Greece", "HR - Croatia", "HU - Hungary", "IE - Ireland", "IS - Iceland", "IT - Italy", "LV - Latvia", "LI - Liechtenstein", "LT - Lithuania", "LU - Luxembourg", "MK - Macedonia", "MD - Moldova", "ME - Montenegro", "NL - Netherlands", "NO - Norway", "PL - Poland", "PT - Portugal", "RO - Romania", "RS - Serbia", "RU - Russia", "SE - Sweden", "SI - Slovenia", "SK - Slovakia", "TR - Turkey", "UA - Ukraine", "UK - United Kingdom", "XK - Kosovo"]
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.status = true
    if @post.save
      redirect_to myposts_path, notice: "Post created"
    else
      # render :new not working
      redirect_to new_post_path, notice: I18n.t('mandatory_fields')
    end
  end

  def index
    @posts = Post.where(status: true).paginate(:page => params[:page], per_page: 10).order(created_at: :desc)
    filter
  end


  def show
    repost
    @post = Post.find(params[:id])
    # display user
    @user = User.find(@post.user_id)
    @posts_count = Post.where(user_id: @user.id).count
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post updated"
    else
      render :new
    end
    authorize @post
  end

  def filter
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  def repost
    if params[:repost].present?
      @post = Post.new(load_c: params[:repost][:load_c], load_city: params[:repost][:load_city], load_address: params[:repost][:load_address], unload_c: params[:repost][:unload_c], unload_city: params[:repost][:unload_city], unload_address: params[:repost][:unload_address], length: params[:repost][:length], weight: params[:repost][:weight], description: params[:repost][:description], truck_type: params[:repost][:truck_type], price: params[:repost][:price])
    else
      @post = Post.new
    end
  end

  private

  def post_params
    params.require(:post).permit(:load_date, :unload_date, :load_time, :unload_time, :length, :weight, :load_address, :unload_address, :description, {truck_type: []}, :adr, :price, :load_city, :unload_city, :load_c, :unload_c)
  end

  def filtering_params(params)
    params.slice(:load_date, :load_c, :unload_c, :truck_type)
  end

end
