class ProjectilesController < ApplicationController
  def index
    @projectiles = Projectile.all
  end

  def show
    @projectile = Projectile.find(params[:id])
  end

  def new
    @projectile = Projectile.new
  end

  def create
    @projectile = Projectile.new(params[:projectile])
    if @projectile.save
      flash[:notice] = "Successfully created projectile."
      redirect_to @projectile
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
end
