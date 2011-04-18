class Members::ProjectilesController < Members::MembersController
  filter_resource_access
  filter_access_to :my_projectiles, :my_favorites
  def index
    @projectile = Projectile.all
  end

  def show
    #@projectile = Projectile.find(params[:id])
  end

  def new
    #@projectile = Projectile.new
  end

  def create
    #@projectile = Projectile.new(params[:projectile])
    @projectile.user = current_user
    if @projectile.save
      flash[:notice] = "Successfully created projectile."
      redirect_to projectile_path(@projectile)
    else
      render :action => 'new'
    end
  end

  def edit
    #@projectile = Projectile.find(params[:id])
  end

  def update
    #@projectile = Projectile.find(params[:id])
    if @projectile.update_attributes(params[:projectile])
      flash[:notice] = "Successfully updated projectile."
      redirect_to projectile_path(@projectile)
    else
      render :action => 'edit'
    end
  end

  def destroy
    #@projectile = Projectile.find(params[:id])
    @projectile.destroy
    flash[:notice] = "Successfully destroyed projectile."
    redirect_to projectiles_url
  end

  def my_projectiles
    @projectile = Projectile.find(:all, :conditions => "user_id = #{current_user.id}")  
  end

  def my_favorites
    @projectile = Projectile.find(:all, :conditions => "favorites.user_id = #{current_user.id}", :include => :favorites)
  end
end
