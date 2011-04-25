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
    @projectile = Projectile.paginate(:page => params[:page], :per_page => 5, :conditions => "user_id = #{current_user.id}", :order => 'created_at DESC')
    @num_projectiles = Projectile.count(:conditions =>"user_id = #{current_user.id}")
    #@projectile = Projectile.find(:all, :conditions => "user_id = #{current_user.id}")  
  end

  def my_favorites
    @projectile = Projectile.paginate(:page => params[:page], :per_page => 5, :conditions => "favorites.user_id = #{current_user.id}", :include => :favorites, :order => 'projectiles.created_at DESC')
    @num_projectiles = Projectile.count(:conditions => "favorites.user_id = #{current_user.id}", :include => :favorites)
  end
end
