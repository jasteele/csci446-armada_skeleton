module ProjectilesHelper

# Give a description truncated to 100 characters, followed by
# the ..., followed by a more link. The link will create an ajax
# request to get the full description.
#
# Yes I realize that it's a waste to do an ajax request to grab
# only a few more characters, but I want practice making ajax 
# calls in rails.
def truncateDescription( projectile, len=100 )
  if projectile.description.length <= len
    # return the full description
    projectile.description
  else
    # Return the truncated description
    output = projectile.description[0..len]
    output += ' ... '
    output += link_to_remote "More", :url => { :action => "description", :id => projectile.id }
    output
  end
end
end
