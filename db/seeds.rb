PaperTrail.whodunnit = 'Seed Data Script'

# Seed the roles.
Role.create!(:name => 'developer', :description => 'The system developer. There is no higher access level.')
Role.create!(:name => 'administrator', :description => 'A system administrator. Full access to all features.')
Role.create!(:name => 'member', :description => 'A typical application user.')


# Seed developer users.
r = Role.find_by_name('developer')

# Jared Steele
team_member_1 = User.new(:first_name => 'Jared',
                         :last_name => 'Steele',
                         :email => 'jasteele@mines.edu',
                         :password => 'changeme',
                         :password_confirmation => 'changeme',
                         :role => r)
team_member_1.save_without_session_maintenance

# Seth Daugherty
team_member_2 = User.new(:first_name => 'Seth',
                         :last_name => 'Daugherty',
                         :email => 'sdaugher@mines.edu',
                         :password => 'changeme',
                         :password_confirmation => 'changeme',
                         :role => r)
team_member_2.save_without_session_maintenance

yong = User.new(:first_name => 'Yong',
                :last_name => 'Bakos',
                :email => 'ybakos@mines.edu',
                :password => 'changeme',
                :password_confirmation => 'changeme',
                :role => r)
yong.save_without_session_maintenance

u = User.all

# Seed the projectiles
Projectile.create!(:name => 'Throwing Knife', :ptype => 'Knife', :cost => 13, :description => 'Throwing knives are knives that are specially designed and weighted so that they can be thrown effectively.', :user => u[0])
Projectile.create!(:name => 'Poison Arrow', :ptype => 'Arrow', :cost => 1, :description => 'Poison arrows have been used by hunter-gatherer peoples worldwide and are still in use in areas of South America, Africa and Asia. The most awesome poisons are secreted from the skin of the poison dart frog and curare, a general term for a range of plant-derived arrow poisons used by the indigenous peoples of South America.', :user => u[0])
Projectile.create!(:name => 'Flaming Arrow', :ptype => 'Arrow', :cost => 1, :description => "Simple: 1) Light an arrow on fire. 2) Shoot onto enemy's roof. 3) ????? 4) Profit! ", :user => u[1])
Projectile.create!(:name => 'Blowgun', :ptype => 'Dart', :cost => 2, :description => "A blowgun is a simple weapon consisting of a small tube for firing light projectiles, or darts.", :user => u[2])
