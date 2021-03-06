class ProjectilesController < ApplicationController
  
  before_filter :require_user, :except => [:index, :show]
  filter_resource_access
  def index
    @projectile = Projectile.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
    @num_projectiles = Projectile.count
    respond_to do |format|
      format.html
      format.xml { render :xml => Projectile.all(:order => 'created_at DESC') }
    end
  end

  def show
    #@projectile = Projectile.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @projectile}
    end
  end

  def new
    #@projectile = Projectile.new
  end

  def create
    #@projectile = Projectile.new(params[:projectile])
    @projectile.user = current_user
    if @projectile.save
      flash[:notice] = "Successfully created projectile."
      redirect_to @projectile
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
      redirect_to @projectile
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

  def description
    @projectile = Projectile.find(params[:id])  
  end
end
