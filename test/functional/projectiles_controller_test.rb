require 'test_helper'

class ProjectilesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Projectile.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Projectile.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Projectile.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to projectile_url(assigns(:projectile))
  end

  def test_edit
    get :edit, :id => Projectile.first
    assert_template 'edit'
  end

  def test_update_invalid
    Projectile.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Projectile.first
    assert_template 'edit'
  end

  def test_update_valid
    Projectile.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Projectile.first
    assert_redirected_to projectile_url(assigns(:projectile))
  end

  def test_destroy
    projectile = Projectile.first
    delete :destroy, :id => projectile
    assert_redirected_to projectiles_url
    assert !Projectile.exists?(projectile.id)
  end
end
