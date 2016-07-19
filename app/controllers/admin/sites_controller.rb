class Admin::SitesController < Admin::BaseController

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      flash[:notice] = "#{@site.name} Created!"
      redirect_to site_path(@site.id)
    else
      flash[:notice] = "Data is missing or invalid! Try again"
      redirect_to new_admin_site_path
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(site_params)
      flash[:notice] = "#{@site.name} Updated!"
      redirect_to site_path(@site.id)
    else
      flash[:notice] = "Data is missing or invalid! Try again"
      redirect_to edit_admin_site_path
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :longitude, :latitude, :site_type)
  end

end
