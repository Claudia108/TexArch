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
  end

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(site_params)
      flash[:notice] = "Site Updated!"
      redirect_to admin_site_path(@site.id)
    else
      flash[:notice] = "Invalid! Try Again"
      render :edit
    end
  end

  def destroy
    site = Site.find(params[:id])
    site.destroy
    flash[:notice] = "Site Deleted!"
    redirect_to admin_sitess_path
  end

  private

  def site_params
    params.require(:site).permit(:name, :longitude, :latitude, :site_type)
  end

end
