class FavoritesController < ApplicationController

  # POST /favorites
  # POST /favorites.xml
  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.save
    flash[:notice] = "Favorite was successfully created."
    respond_to do |format|
      format.html { redirect_to members_projectiles_path } 
      format.js
    end
  end

  
  def destroy
    @favorite = Favorite.find(params[:id])
    respond_to do |format|
      @favorite.destroy
      flash[:notice] = "Successfully destroyed projectile."
      format.html { redirect_to members_projectiles_path }
      format.js
    end
  end

end
