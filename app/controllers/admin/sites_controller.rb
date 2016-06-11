class Admin::SitesController < Admin::BaseController

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      flash[:notice] = "#{@site.name} was created!"
      redirect_to admin_site_path(@site.id)
    else
      flash[:notice] = "Invalid! Try Again"
      render :new
    end

    def index
      @sites = Site.all
    end

    def show
      @site = Site.find(params[:id])
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :longitude, :latitude, :site_type)
  end

end
