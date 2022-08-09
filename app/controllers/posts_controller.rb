class PostsController < ApplicationController
  def new
    @post = Post.new
    @countries = ["AL 🇦🇱 Albania", "AD 🇦🇩 Andorra", "AM 🇦🇲 Armenia", "AT 🇦🇹 Austria", "AZ 🇦🇿 Azerbaijan", "BA 🇧🇦 Bosnia and Herzegovina", "BE 🇧🇪 Belgium", "BG 🇧🇬 Bulgaria", "BY 🇧🇾 Belarus", "CH 🇨🇭 Switzerland", "CY 🇨🇾 Cyprus", "CZ 🇨🇿 Czech Republic", "DE 🇩🇪 Germany", "DK 🇩🇰 Denmark", "EE 🇪🇪 Estonia", "ES 🇪🇸 Spain", "FI 🇫🇮 Finland", "FR 🇫🇷 France", "GE 🇬🇪 Georgia", "GR 🇬🇷 Greece", "HR 🇭🇷 Croatia", "HU 🇭🇺 Hungary", "IE 🇮🇪 Ireland", "IS 🇮🇸 Iceland", "IT 🇮🇹 Italy", "LV 🇱🇻 Latvia", "LI 🇱🇮 Liechtenstein", "LT 🇱🇹 Lithuania", "LU 🇱🇺 Luxembourg", "MK 🇲🇰 Macedonia", "MD 🇲🇩 Moldova", "ME 🇲🇪 Montenegro", "NL 🇳🇱 Netherlands", "NO 🇳🇴 Norway", "PL 🇵🇱 Poland", "PT 🇵🇹 Portugal", "RO 🇷🇴 Romania", "RS 🇷🇸 Serbia", "RU 🇷🇺 Russia", "SE 🇸🇪 Sweden", "SI 🇸🇮 Slovenia", "SK 🇸🇰 Slovakia", "TR 🇹🇷 Turkey", "UA 🇺🇦 Ukraine", "UK 🇬🇧 United Kingdom", "XK 🇽🇰 Kosovo"]
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
    params.require(:post).permit(:load_date, :unload_date, :load_time, :unload_time, :length, :weight, :load_address, :unload_address, :description, :truck_type, :adr, :price, :load_city, :unload_city, :load_c, :unload_c)
  end

end
