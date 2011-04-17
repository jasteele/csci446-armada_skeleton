class FavoritesController < ApplicationController

  # POST /favorites
  # POST /favorites.xml
  def create
    @favorite = Favorite.new(params[:favorite])
    flash[:notice] = "Favorite was successfully created."
    respond_to do |format|
      format.html { redirect_to members_projectiles_path } 
      format.js
    end
  end

end
