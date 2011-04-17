class Members::MembersController < ApplicationController
  before_filter :require_user

  def index
    render
  end
  
  protected

    def permission_denied
      flash[:error] = "You do not have access to #{request.path}."
      respond_to do |format|
        format.html { redirect_to projectiles_path }
        format.xml { head :unauthorized }
        format.js { head :unauthorized }
      end
    end
  
end
