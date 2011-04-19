module ProjectilesHelper
def truncateDescription( projectile, len=100 )
  if projectile.description.length <= len
    projectile.description
  else
    output = projectile.description[0..len]
    output += ' ... '
    output += link_to 'More', "#",  :id => "more_" + projectile.id.to_s, :class => "moreLink", :rel => projectile.id.to_s 
  end
end
end
