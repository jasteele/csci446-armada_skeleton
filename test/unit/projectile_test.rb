require 'test_helper'

class ProjectileTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Projectile.new.valid?
  end
end
