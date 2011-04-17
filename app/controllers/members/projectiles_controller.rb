class Members::ProjectilesController < Members::MembersController
  filter_resource_access
  def index
    @projectile = Projectile.all
  end

  def show
    @projectile = Projectile.find(params[:id])
  end

  def new
    @projectile = Projectile.new
  end

  def create
    @projectile = Projectile.new(params[:projectile])
    @projectile.user = current_user
    if @projectile.save
      flash[:notice] = "Successfully created projectile."
      redirect_to members_projectile_path(@projectile)
    else
      render :action => 'new'
    end
  end

  def edit
    @projectile = Projectile.find(params[:id])
  end

  def update
    @projectile = Projectile.find(params[:id])
    if @projectile.update_attributes(params[:projectile])
      flash[:notice] = "Successfully updated projectile."
      redirect_to members_projectile_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @projectile = Projectile.find(params[:id])
    @projectile.destroy
    flash[:notice] = "Successfully destroyed projectile."
    redirect_to projectiles_url
  end
end
