document.observe("dom:loaded", function() {
  var p = $$('a.moreLink');
  for( var i=0; i < p.length; i++ ) {
    Event.observe( p[i], 'click', function(e) {
      e.stop();
      var rel = this.readAttribute('rel');
      var short_id = "desc_short_" + rel;
      var full_id = "descript_" + rel;
      console.log(short_id, full_id);
      $(short_id).hide();
      $(full_id).removeClassName('fullDescription');
    }, false);
  }
});
