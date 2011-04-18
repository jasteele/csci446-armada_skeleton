module FavoritesHelper

# Return true if the user has favorited the projectile
def isFavorited?(projectile_id, user_id)
  fav = Favorite.find(:first, :conditions => ["projectile_id = ? and user_id = ?", projectile_id, user_id])
  if fav.nil?
    false
  else
    true
  end
end

# Return :post if the favorite doesn't exist, and :delete otherwise
def form_method(projectile_id, user_id)

  if isFavorited? projectile_id, user_id 
    return :delete
  else
    return :post
  end
end

# Return 
def form_action(projectile_id, user_id) 
  fav = Favorite.find(:first, :conditions => ["projectile_id = ? and user_id = ?", projectile_id, user_id])
  if fav.nil?
    favorites_path
  else
    url_for( fav )
  end
end

# Return the a gold or silver star depending on if the user has
# favorited the projectile
def fav_img_tag(projectile_id, user_id)
  if isFavorited? projectile_id, user_id
    icon = 'icon_small_star.png'
    #link_to :favorite
    #link_to image_tag(icon), :favorite, :method => :post, :projectile_id => projectile_id, :user_id => user_id 
  else
    icon = 'icon_small_star_inactive.png'
    #link_to_remote {:url => favorites_path, :method => :post, :remote => :true, :id => 'img_' + projectile_id.to_s }, { :projectile_id => projectile_id, :user_id => user_id, :body => image_tag(icon)} 
  end
  image_submit_tag( icon, :id => 'img_' + projectile_id.to_s )

end

end
